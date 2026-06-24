#!/usr/bin/env sh
set -eu

image="${1:-docker-course/nginx-basic:local}"
name="lesson-00-smoke"
port="${PORT:-8080}"

docker rm -f "$name" >/dev/null 2>&1 || true
docker run -d --name "$name" -p "$port:80" "$image" >/dev/null

cleanup() {
  docker rm -f "$name" >/dev/null 2>&1 || true
}
trap cleanup EXIT INT TERM

sleep 2
curl -fsS "http://localhost:$port" >/dev/null
echo "smoke test ok: http://localhost:$port"
