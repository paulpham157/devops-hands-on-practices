#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

for file in README.md compose.yaml gateway/nginx.conf prometheus/prometheus.yml slo/order-flow.yml scripts/up.sh scripts/check.sh scripts/cleanup.sh; do
  if [ ! -f "$ROOT_DIR/$file" ]; then
    echo "Missing reference-system file: $file" >&2
    exit 1
  fi
done

sh -n "$ROOT_DIR/scripts/up.sh" "$ROOT_DIR/scripts/check.sh" "$ROOT_DIR/scripts/cleanup.sh"

if command -v docker >/dev/null 2>&1; then
  (cd "$ROOT_DIR" && docker compose config >/dev/null)
else
  echo "docker not available; skipped Compose rendering"
fi

echo "Reference-system structure is valid."
