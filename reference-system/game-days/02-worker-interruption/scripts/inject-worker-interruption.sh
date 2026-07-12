#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/../../.." && pwd)
cd "$ROOT_DIR"

docker compose stop worker
curl --fail --silent --show-error \
  -H 'Content-Type: application/json' \
  -H 'X-Role: learner' \
  --data '{"id":"interrupted-order"}' \
  http://127.0.0.1:8088/orders >/dev/null
echo "Worker stopped and interrupted-order submitted. Inspect queue state before recovering."
