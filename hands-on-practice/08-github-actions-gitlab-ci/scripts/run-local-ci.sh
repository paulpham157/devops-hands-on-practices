#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
LESSON_DIR=$(dirname "$SCRIPT_DIR")
APP_DIR="$LESSON_DIR/sample-app"
IMAGE_NAME="${IMAGE_NAME:-docker-course/ci-platform-sample:local}"
CONTAINER_NAME="${CONTAINER_NAME:-ci-platform-sample-local}"

echo "==> Test Python app in a disposable container"
docker run --rm \
  -v "$APP_DIR:/app" \
  -w /app \
  python:3.12-slim \
  sh -c "python -m pip install -r requirements-dev.txt && python -m pytest -q && python -m py_compile app.py"

echo "==> Build Docker image"
docker build -t "$IMAGE_NAME" "$APP_DIR"

echo "==> Smoke test Docker image"
docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true
docker run -d --name "$CONTAINER_NAME" "$IMAGE_NAME" >/dev/null
trap 'docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true' EXIT

for _ in $(seq 1 20); do
  if docker exec "$CONTAINER_NAME" python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:5000/healthz')" >/dev/null 2>&1; then
    echo "Smoke test passed"
    exit 0
  fi
  sleep 1
done

echo "Smoke test failed"
docker logs "$CONTAINER_NAME"
exit 1
