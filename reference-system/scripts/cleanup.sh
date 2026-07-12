#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT_DIR"

if [ "${1:-}" = "--volumes" ]; then
  docker compose down --volumes
else
  docker compose down
fi
