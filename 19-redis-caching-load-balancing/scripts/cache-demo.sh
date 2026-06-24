#!/usr/bin/env sh
set -eu

BASE_URL="${BASE_URL:-http://localhost:5190}"
PRODUCT_ID="${PRODUCT_ID:-42}"

echo "First request should usually be a miss:"
curl -fsS "$BASE_URL/product/$PRODUCT_ID"
echo

echo "Second request should usually be a hit:"
curl -fsS "$BASE_URL/product/$PRODUCT_ID"
echo

