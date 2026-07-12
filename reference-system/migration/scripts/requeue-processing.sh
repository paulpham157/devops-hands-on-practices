#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
cd "$ROOT_DIR"

count=0
while true; do
  order=$(docker compose exec -T redis redis-cli --raw RPOP processing_orders | tr -d '\r')
  [ -n "$order" ] || break
  docker compose exec -T redis redis-cli LPUSH order_queue "$order" >/dev/null
  count=$((count + 1))
done

echo "Requeued $count local processing item(s). Verify idempotency before using this pattern outside the lab."
