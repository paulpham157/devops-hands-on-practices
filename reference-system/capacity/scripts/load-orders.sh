#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd)
REQUESTS=100
CONCURRENCY=5

while [ "$#" -gt 0 ]; do
  case "$1" in
    --requests)
      REQUESTS=${2:?missing request count}
      shift 2
      ;;
    --concurrency)
      CONCURRENCY=${2:?missing concurrency}
      shift 2
      ;;
    *)
      echo "Usage: $0 [--requests N] [--concurrency N]" >&2
      exit 2
      ;;
  esac
done

case "$REQUESTS:$CONCURRENCY" in
  *[!0-9:]*|:*|0:*|*:0)
    echo "Request count and concurrency must be positive integers." >&2
    exit 2
    ;;
esac

if [ "$REQUESTS" -gt 1000 ] || [ "$CONCURRENCY" -gt 25 ]; then
  echo "Local safety limit exceeded (max 1000 requests and 25 concurrency)." >&2
  exit 2
fi

if ! command -v hey >/dev/null 2>&1; then
  echo "hey is required for the optional load exercise. Install it, then rerun this command." >&2
  exit 127
fi

order_id="load-$(date +%s)"
cd "$ROOT_DIR"
hey -n "$REQUESTS" -c "$CONCURRENCY" -m POST \
  -H 'Content-Type: application/json' \
  -H 'X-Role: learner' \
  -d "{\"id\":\"$order_id\"}" \
  http://127.0.0.1:8088/orders
