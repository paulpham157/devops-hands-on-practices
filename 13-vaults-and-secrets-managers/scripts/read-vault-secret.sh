#!/usr/bin/env sh
set -eu

docker compose exec -T vault sh -lc \
  'VAULT_ADDR=http://127.0.0.1:8200 VAULT_TOKEN=root vault kv get secret/docker-course'
