#!/usr/bin/env sh
set -eu

HTTP_PORT="${HTTP_PORT:-8089}"
URL="${URL:-http://localhost:${HTTP_PORT}/}"

for _ in $(seq 1 30); do
  if curl -fsS "$URL" | grep -q "K3s Local Cluster"; then
    echo "Ingress test passed: $URL"
    exit 0
  fi
  sleep 2
done

echo "Ingress test failed: $URL" >&2
exit 1
