#!/usr/bin/env sh
set -eu

BASE_URL="${BASE_URL:-http://localhost:5190}"
REQUESTS="${REQUESTS:-60}"
CONCURRENCY="${CONCURRENCY:-10}"
PRODUCT_ID="${PRODUCT_ID:-42}"

mkdir -p reports
OUT="reports/load-test-$(date +%Y%m%d%H%M%S).jsonl"

echo "Sending $REQUESTS requests to $BASE_URL/product/$PRODUCT_ID with concurrency $CONCURRENCY"

i=1
running=0
while [ "$i" -le "$REQUESTS" ]; do
  (
    curl -fsS "$BASE_URL/product/$PRODUCT_ID" >> "$OUT"
    printf '\n' >> "$OUT"
  ) &
  running=$((running + 1))
  i=$((i + 1))

  if [ "$running" -ge "$CONCURRENCY" ]; then
    wait
    running=0
  fi
done

wait

echo "Wrote $OUT"
echo "Cache hits:"
grep -c '"cache":"hit"' "$OUT" || true
echo "Cache misses:"
grep -c '"cache":"miss"' "$OUT" || true
echo "Instances:"
grep -o '"instance":"[^"]*"' "$OUT" | sort | uniq -c

