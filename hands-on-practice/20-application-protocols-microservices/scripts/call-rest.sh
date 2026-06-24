#!/usr/bin/env sh
set -eu

BASE_URL="${BASE_URL:-http://localhost:5200}"
PRODUCT_ID="${PRODUCT_ID:-42}"

echo "REST health:"
curl -fsS "$BASE_URL/healthz"
echo

echo "REST product:"
curl -fsS "$BASE_URL/products/$PRODUCT_ID"
echo

