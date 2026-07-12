#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/../../.." && pwd)
cd "$ROOT_DIR"
docker compose start redis
echo "Redis start requested. Verify recovery through the user journey and scripts/check.sh."
