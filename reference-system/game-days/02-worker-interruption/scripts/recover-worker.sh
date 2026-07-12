#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/../../.." && pwd)
cd "$ROOT_DIR"

docker compose start worker
echo "Worker start requested. Verify processing and user journey before declaring recovery complete."
