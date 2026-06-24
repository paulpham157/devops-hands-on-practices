#!/usr/bin/env sh
set -eu

docker compose down -v --remove-orphans
rm -f secrets/demo_api_token.txt
