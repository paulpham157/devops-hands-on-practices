#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT_DIR"

order_id="demo-$(date +%s)-$$"
curl --fail --silent --show-error --retry 10 --retry-connrefused \
  -H 'Content-Type: application/json' \
  -H 'X-Role: learner' \
  --data "{\"id\":\"$order_id\"}" \
  http://127.0.0.1:8088/orders >/dev/null

attempt=0
while [ "$attempt" -lt 10 ]; do
  if docker compose exec -T redis redis-cli LRANGE processed_order_ids 0 -1 | tr -d '\r' | grep -Fx "$order_id" >/dev/null; then
    break
  fi
  attempt=$((attempt + 1))
  sleep 1
done

if [ "$attempt" -eq 10 ]; then
  echo "Worker did not process the queued order." >&2
  exit 1
fi

attempt=0
while [ "$attempt" -lt 10 ]; do
  processing=$(docker compose exec -T redis redis-cli LLEN processing_orders | tr -d '\r')
  if [ "$processing" = "0" ]; then
    echo "Reference-system check passed: worker processed $order_id and acknowledged its processing entry."
    exit 0
  fi
  attempt=$((attempt + 1))
  sleep 1
done

echo "Worker processed $order_id but did not acknowledge the processing entry." >&2
exit 1
