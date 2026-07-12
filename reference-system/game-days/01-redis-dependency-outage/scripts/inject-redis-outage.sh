#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/../../.." && pwd)
cd "$ROOT_DIR"
docker compose stop redis
echo "Local Redis outage injected. Investigate the user-visible impact before recovering it."
