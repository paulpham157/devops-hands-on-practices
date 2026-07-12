#!/usr/bin/env sh
set -eu

attempt=0
while [ "$attempt" -lt 15 ]; do
  if curl --fail --silent --show-error 'http://127.0.0.1:9098/api/v1/query?query=orders_queued_total' | grep -q 'orders_queued_total'; then
    echo "Observability check passed: Prometheus scraped orders_queued_total."
    exit 0
  fi
  attempt=$((attempt + 1))
  sleep 1
done

echo "Prometheus did not scrape orders_queued_total. Run scripts/up.sh --observability first." >&2
exit 1
