import os
import time
from flask import Flask


SERVICE_NAME = "python-flask"
app = Flask(__name__)


@app.get("/")
def index():
    return {
        "service": SERVICE_NAME,
        "language": "Python",
        "framework": "Flask",
        "message": "hello from Python Flask",
    }


@app.get("/healthz")
def healthz():
    return {"status": "ok", "service": SERVICE_NAME}


@app.get("/work")
def work():
    started = time.perf_counter()
    total = sum(range(10000))
    elapsed_ms = round((time.perf_counter() - started) * 1000, 3)
    return {"service": SERVICE_NAME, "result": total, "elapsed_ms": elapsed_ms}


if __name__ == "__main__":
    host = os.environ.get("FLASK_HOST", "0.0.0.0")
    port = int(os.environ.get("FLASK_PORT", "5000"))
    app.run(host=host, port=port)

