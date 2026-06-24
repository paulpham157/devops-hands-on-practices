#!/usr/bin/env sh
set -eu

LOG_FILE="${1:-sample-data/app.log}"

echo "Errors:"
grep "ERROR" "$LOG_FILE"

echo
echo "Requests by status code:"
awk '{ for (i = 1; i <= NF; i++) if ($i ~ /^status=/) { sub(/^status=/, "", $i); print $i } }' "$LOG_FILE" |
  sort |
  uniq -c

echo
echo "Slow checkout requests:"
awk '$0 ~ /service=checkout/ { print }' "$LOG_FILE" |
  awk '{ for (i = 1; i <= NF; i++) if ($i ~ /^latency_ms=/) { split($i, a, "="); if (a[2] >= 100) print } }'

