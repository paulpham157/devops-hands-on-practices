#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

for file in README.md compose.yaml gateway/nginx.conf prometheus/prometheus.yml slo/order-flow.yml scripts/up.sh scripts/check.sh scripts/check-observability.sh scripts/cleanup.sh; do
  if [ ! -f "$ROOT_DIR/$file" ]; then
    echo "Missing reference-system file: $file" >&2
    exit 1
  fi
done

for file in game-days/01-redis-dependency-outage/README.md game-days/01-redis-dependency-outage/evidence/incident-template.md game-days/01-redis-dependency-outage/rubric.md game-days/01-redis-dependency-outage/facilitator-notes.md game-days/01-redis-dependency-outage/scripts/inject-redis-outage.sh game-days/01-redis-dependency-outage/scripts/recover-redis.sh; do
  if [ ! -f "$ROOT_DIR/$file" ]; then
    echo "Missing game-day file: $file" >&2
    exit 1
  fi
done

for file in dr/README.md dr/rpo-rto-template.md dr/scripts/backup-redis.sh dr/scripts/restore-redis.sh; do
  if [ ! -f "$ROOT_DIR/$file" ]; then
    echo "Missing disaster-recovery file: $file" >&2
    exit 1
  fi
done

for file in capacity/README.md capacity/capacity-decision-template.md capacity/cost-model-template.md capacity/scripts/load-orders.sh; do
  if [ ! -f "$ROOT_DIR/$file" ]; then
    echo "Missing capacity file: $file" >&2
    exit 1
  fi
done

sh -n "$ROOT_DIR/scripts/up.sh" "$ROOT_DIR/scripts/check.sh" "$ROOT_DIR/scripts/check-observability.sh" "$ROOT_DIR/scripts/cleanup.sh" "$ROOT_DIR/game-days/01-redis-dependency-outage/scripts/inject-redis-outage.sh" "$ROOT_DIR/game-days/01-redis-dependency-outage/scripts/recover-redis.sh" "$ROOT_DIR/dr/scripts/backup-redis.sh" "$ROOT_DIR/dr/scripts/restore-redis.sh" "$ROOT_DIR/capacity/scripts/load-orders.sh"

if command -v docker >/dev/null 2>&1; then
  (cd "$ROOT_DIR" && docker compose config >/dev/null)
else
  echo "docker not available; skipped Compose rendering"
fi

echo "Reference-system structure is valid."
