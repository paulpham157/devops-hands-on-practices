import os

from flask import Flask


app = Flask(__name__)


@app.get("/")
def index():
    return {
        "message": "Jenkins CI sample app",
        "status": "ok",
    }


@app.get("/healthz")
def healthz():
    return {"status": "ok"}


if __name__ == "__main__":
    host = os.environ.get("FLASK_HOST", "0.0.0.0")
    port = int(os.environ.get("FLASK_PORT", "5000"))
    app.run(host=host, port=port)

