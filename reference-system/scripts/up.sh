#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT_DIR"

if [ "${1:-}" = "--observability" ]; then
  docker compose --profile observability up --build --detach
else
  docker compose up --build --detach
fi
docker compose ps
