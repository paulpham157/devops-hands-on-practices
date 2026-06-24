#!/usr/bin/env sh
set -eu

BASE_URL="${BASE_URL:-http://localhost:5190}"

curl -fsS -X POST "$BASE_URL/cache/clear"
echo
docker compose exec -T redis redis-cli del lesson19:stats:requests lesson19:stats:hits lesson19:stats:misses >/dev/null
rm -rf reports
echo "Cleared Redis lesson keys and local reports"

