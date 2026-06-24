import os
from flask import Flask, jsonify


app = Flask(__name__)


def product_payload(product_id):
    return {
        "id": product_id,
        "name": f"training-product-{product_id}",
        "price": 19.0 + (int(product_id) % 5) * 2 if product_id.isdigit() else 19.0,
        "protocol": "rest",
    }


@app.get("/")
def index():
    return jsonify(
        {
            "service": "catalog-rest-api",
            "protocol": "HTTP REST",
            "try": ["/products/42", "/healthz"],
            "contract": "/openapi.yaml",
        }
    )


@app.get("/healthz")
def healthz():
    return jsonify({"status": "ok"})


@app.get("/products/<product_id>")
def get_product(product_id):
    return jsonify(product_payload(product_id))


@app.get("/openapi.yaml")
def openapi():
    with open("openapi.yaml", "r", encoding="utf-8") as contract:
        return app.response_class(contract.read(), mimetype="application/yaml")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.environ.get("PORT", "5000")))

