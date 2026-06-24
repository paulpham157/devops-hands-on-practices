import os

from flask import Flask, jsonify


def create_app() -> Flask:
    app = Flask(__name__)

    @app.get("/")
    def index():
        return jsonify(
            {
                "message": "CI platform sample app",
                "version": os.getenv("APP_VERSION", "dev"),
            }
        )

    @app.get("/healthz")
    def healthz():
        return jsonify({"status": "ok"})

    return app


app = create_app()


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
