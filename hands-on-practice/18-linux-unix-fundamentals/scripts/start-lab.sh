#!/usr/bin/env sh
set -eu

docker compose up -d

echo "Lab containers are running."
echo "Ubuntu shell: ./scripts/shell-ubuntu.sh"
echo "Alpine shell: ./scripts/shell-alpine.sh"

