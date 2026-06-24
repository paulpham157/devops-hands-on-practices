import json
import os
import time
from datetime import datetime, timezone

from flask import Flask, jsonify
from redis import Redis
from redis.exceptions import RedisError


INSTANCE_NAME = os.environ.get("INSTANCE_NAME", "app-local")
REDIS_URL = os.environ.get("REDIS_URL", "redis://localhost:6379/0")
CACHE_TTL_SECONDS = int(os.environ.get("CACHE_TTL_SECONDS", "20"))
ORIGIN_DELAY_MS = int(os.environ.get("ORIGIN_DELAY_MS", "180"))

app = Flask(__name__)
redis_client = Redis.from_url(REDIS_URL, decode_responses=True)

local_stats = {
    "requests": 0,
    "hits": 0,
    "misses": 0,
    "redis_errors": 0,
}


def cache_key(product_id):
    return f"lesson19:product:{product_id}"


def stats_key(name):
    return f"lesson19:stats:{name}"


def now_utc():
    return datetime.now(timezone.utc).isoformat()


def expensive_origin_lookup(product_id):
    time.sleep(ORIGIN_DELAY_MS / 1000)
    return {
        "id": product_id,
        "name": f"training-product-{product_id}",
        "price": round(19.0 + (int(product_id) % 7) * 2.5, 2) if product_id.isdigit() else 19.0,
        "origin_generated_at": now_utc(),
    }


def increment_stat(name):
    local_stats[name] += 1
    try:
        redis_client.incr(stats_key(name))
    except RedisError:
        local_stats["redis_errors"] += 1


@app.get("/")
def index():
    return jsonify(
        {
            "service": "redis-caching-load-balancing",
            "instance": INSTANCE_NAME,
            "try": ["/product/42", "/stats", "/healthz"],
        }
    )


@app.get("/healthz")
def healthz():
    try:
        redis_client.ping()
        redis_status = "ok"
    except RedisError:
        redis_status = "error"
    return jsonify({"status": "ok", "instance": INSTANCE_NAME, "redis": redis_status})


@app.get("/product/<product_id>")
def product(product_id):
    started = time.perf_counter()
    key = cache_key(product_id)
    increment_stat("requests")

    try:
        cached = redis_client.get(key)
    except RedisError:
        cached = None
        local_stats["redis_errors"] += 1

    if cached:
        increment_stat("hits")
        payload = json.loads(cached)
        source = "redis-cache"
        cache_status = "hit"
        origin_latency_ms = 0
    else:
        increment_stat("misses")
        origin_started = time.perf_counter()
        payload = expensive_origin_lookup(product_id)
        origin_latency_ms = round((time.perf_counter() - origin_started) * 1000, 2)
        source = "slow-origin"
        cache_status = "miss"
        try:
            redis_client.setex(key, CACHE_TTL_SECONDS, json.dumps(payload, separators=(",", ":")))
        except RedisError:
            local_stats["redis_errors"] += 1

    try:
        ttl = redis_client.ttl(key)
    except RedisError:
        ttl = -2

    elapsed_ms = round((time.perf_counter() - started) * 1000, 2)
    return jsonify(
        {
            "instance": INSTANCE_NAME,
            "cache": cache_status,
            "source": source,
            "key": key,
            "ttl_seconds": ttl,
            "origin_latency_ms": origin_latency_ms,
            "elapsed_ms": elapsed_ms,
            "data": payload,
        }
    )


@app.delete("/cache/<product_id>")
def invalidate_product(product_id):
    key = cache_key(product_id)
    deleted = redis_client.delete(key)
    return jsonify({"deleted": deleted, "key": key, "instance": INSTANCE_NAME})


@app.post("/cache/clear")
def clear_cache():
    keys = list(redis_client.scan_iter("lesson19:*"))
    deleted = redis_client.delete(*keys) if keys else 0
    for stat in local_stats:
        local_stats[stat] = 0
    return jsonify({"deleted": deleted, "instance": INSTANCE_NAME})


@app.get("/stats")
def stats():
    redis_stats = {}
    for name in ("requests", "hits", "misses"):
        try:
            redis_stats[name] = int(redis_client.get(stats_key(name)) or 0)
        except RedisError:
            redis_stats[name] = None
    return jsonify({"instance": INSTANCE_NAME, "local": local_stats, "redis": redis_stats})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

