import os

from flask import Flask, render_template
from redis import Redis


app = Flask(__name__)

redis_client = Redis(
    host=os.environ.get("REDIS_HOST", "localhost"),
    port=int(os.environ.get("REDIS_PORT", "6379")),
    decode_responses=True,
)


@app.get("/")
def index():
    hits = redis_client.incr("page_hits")
    return render_template("index.html", hits=hits)


@app.get("/healthz")
def healthz():
    redis_client.ping()
    return {"status": "ok"}


if __name__ == "__main__":
    host = os.environ.get("FLASK_HOST", "127.0.0.1")
    port = int(os.environ.get("FLASK_PORT", "5000"))
    app.run(host=host, port=port)

