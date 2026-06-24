import json
import os
import random
import sys
import time
from datetime import datetime, timezone

from flask import Flask, Response, abort, g, request
from prometheus_client import CONTENT_TYPE_LATEST, Counter, Histogram, generate_latest


SERVICE_NAME = "course-app"
LOG_PATH = os.environ.get("APP_LOG_PATH", "/var/log/course/app.log")

app = Flask(__name__)

requests_total = Counter(
    "http_requests_total",
    "Total HTTP requests handled by the course app.",
    ["service", "method", "endpoint", "status"],
)

request_duration_seconds = Histogram(
    "http_request_duration_seconds",
    "HTTP request duration in seconds.",
    ["service", "method", "endpoint", "status"],
    buckets=(0.01, 0.05, 0.1, 0.25, 0.5, 1, 2, 5),
)


def write_log(entry):
    os.makedirs(os.path.dirname(LOG_PATH), exist_ok=True)
    line = json.dumps(entry, separators=(",", ":"))
    print(line, file=sys.stdout, flush=True)
    with open(LOG_PATH, "a", encoding="utf-8") as log_file:
        log_file.write(line + "\n")


@app.before_request
def start_timer():
    g.started_at = time.perf_counter()


@app.after_request
def record_request(response):
    duration = time.perf_counter() - g.get("started_at", time.perf_counter())
    endpoint = request.endpoint or "unknown"
    status = str(response.status_code)
    method = request.method

    requests_total.labels(SERVICE_NAME, method, endpoint, status).inc()
    request_duration_seconds.labels(SERVICE_NAME, method, endpoint, status).observe(duration)

    write_log(
        {
            "timestamp": datetime.now(timezone.utc).isoformat(),
            "service": SERVICE_NAME,
            "level": "ERROR" if response.status_code >= 500 else "INFO",
            "method": method,
            "path": request.path,
            "endpoint": endpoint,
            "status": response.status_code,
            "latency_ms": round(duration * 1000, 2),
            "message": "request handled",
        }
    )
    return response


@app.errorhandler(500)
def internal_error(error):
    return {"error": "simulated failure"}, 500


@app.get("/")
def index():
    return {
        "message": "observability practice",
        "try": ["/metrics", "/slow", "/fail"],
    }


@app.get("/slow")
def slow():
    time.sleep(random.uniform(0.3, 1.2))
    return {"message": "slow response"}


@app.get("/fail")
def fail():
    abort(500)


@app.get("/healthz")
def healthz():
    return {"status": "ok"}


@app.get("/metrics")
def metrics():
    return Response(generate_latest(), mimetype=CONTENT_TYPE_LATEST)


if __name__ == "__main__":
    host = os.environ.get("FLASK_HOST", "127.0.0.1")
    port = int(os.environ.get("FLASK_PORT", "5000"))
    app.run(host=host, port=port)

