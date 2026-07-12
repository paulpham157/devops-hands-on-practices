#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
BACKUP_FILE="$ROOT_DIR/dr/backups/redis-dump.rdb"
cd "$ROOT_DIR"

if [ ! -f "$BACKUP_FILE" ]; then
  echo "Missing backup: dr/backups/redis-dump.rdb. Run backup-redis.sh first." >&2
  exit 1
fi

docker compose stop redis
docker compose cp "$BACKUP_FILE" redis:/data/dump.rdb
docker compose start redis
echo "Restore requested from dr/backups/redis-dump.rdb. Verify the user journey before declaring recovery complete."
