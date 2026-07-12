import os

from flask import Flask, Response, render_template, request
from prometheus_client import CONTENT_TYPE_LATEST, Counter, generate_latest
from redis import Redis


app = Flask(__name__)

redis_client = Redis(
    host=os.environ.get("REDIS_HOST", "localhost"),
    port=int(os.environ.get("REDIS_PORT", "6379")),
    decode_responses=True,
)

orders_queued_total = Counter(
    "orders_queued_total",
    "Orders accepted by the local reference-system API.",
)


@app.get("/")
def index():
    hits = redis_client.incr("page_hits")
    return render_template("index.html", hits=hits)


@app.get("/healthz")
def healthz():
    redis_client.ping()
    return {"status": "ok"}


@app.post("/orders")
def create_order():
    payload = request.get_json(silent=True) or {}
    order_id = payload.get("id")
    if not isinstance(order_id, str) or not order_id.strip():
        return {"error": "JSON field 'id' must be a non-empty string"}, 400

    redis_client.lpush("order_queue", order_id)
    orders_queued_total.inc()
    return {"status": "queued", "id": order_id}, 202


@app.get("/metrics")
def metrics():
    return Response(generate_latest(), mimetype=CONTENT_TYPE_LATEST)


if __name__ == "__main__":
    host = os.environ.get("FLASK_HOST", "127.0.0.1")
    port = int(os.environ.get("FLASK_PORT", "5000"))
    app.run(host=host, port=port)
