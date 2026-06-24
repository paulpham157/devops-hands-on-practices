#!/usr/bin/env sh
set -eu

./scripts/prepare-compose-secret.sh
docker compose up --build app
