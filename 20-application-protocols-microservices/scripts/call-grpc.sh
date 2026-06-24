#!/usr/bin/env sh
set -eu

PRODUCT_ID="${PRODUCT_ID:-42}"

docker compose exec -T grpc-service python client.py "$PRODUCT_ID"

