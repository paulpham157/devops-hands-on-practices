import json
import os
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer


def read_secret(path):
    if not path or not os.path.exists(path):
        return None

    with open(path, "r", encoding="utf-8") as secret_file:
        return secret_file.read().strip()


def mask_secret(value):
    if not value:
        return None
    if len(value) <= 6:
        return "***"
    return f"{value[:3]}...{value[-3:]}"


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        secret_path = os.getenv("SECRET_FILE", "")
        secret_value = read_secret(secret_path)
        payload = {
            "service": os.getenv("APP_NAME", "secrets-demo"),
            "secret_source": "file" if secret_value else "missing",
            "secret_length": len(secret_value) if secret_value else 0,
            "secret_preview": mask_secret(secret_value),
        }
        body = json.dumps(payload).encode("utf-8")
        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def log_message(self, format, *args):
        return


if __name__ == "__main__":
    server = ThreadingHTTPServer(("0.0.0.0", 8080), Handler)
    server.serve_forever()
