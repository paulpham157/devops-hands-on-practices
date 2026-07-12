#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
BACKUP_DIR="$ROOT_DIR/dr/backups"
cd "$ROOT_DIR"

mkdir -p "$BACKUP_DIR"
docker compose exec -T redis redis-cli SAVE >/dev/null
docker compose cp redis:/data/dump.rdb "$BACKUP_DIR/redis-dump.rdb"
echo "Created local Redis backup at dr/backups/redis-dump.rdb."
