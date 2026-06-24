#!/usr/bin/env sh
set -eu

BASE_URL="${BASE_URL:-http://localhost:5016}"

curl -fsS "$BASE_URL/" >/dev/null

i=1
while [ "$i" -le 8 ]; do
  curl -fsS "$BASE_URL/checkout" >/dev/null
  i=$((i + 1))
done

i=1
while [ "$i" -le 3 ]; do
  curl -fsS "$BASE_URL/checkout?slow=true" >/dev/null
  i=$((i + 1))
done

curl -fsS "$BASE_URL/checkout?fail=true" >/dev/null 2>&1 || true

echo "Generated traces for $BASE_URL"
echo "Open Jaeger at http://localhost:16686 and search for service course-otel-app"
