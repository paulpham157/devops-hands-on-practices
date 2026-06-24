#!/usr/bin/env sh
set -eu

BASE_URL="${BASE_URL:-http://localhost:5190}"

echo "App stats through load balancer:"
curl -fsS "$BASE_URL/stats"
echo

echo "Redis INFO stats:"
docker compose exec -T redis redis-cli info stats | sed -n '1,40p'

echo
echo "Redis memory:"
docker compose exec -T redis redis-cli info memory | sed -n '1,35p'

