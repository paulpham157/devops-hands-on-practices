#!/usr/bin/env sh
set -eu

docker compose up -d --build

echo "Stack is starting."
echo "Load balancer: http://localhost:5190"
echo "Try: curl -fsS http://localhost:5190/product/42"

