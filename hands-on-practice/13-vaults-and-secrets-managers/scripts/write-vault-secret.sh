#!/usr/bin/env sh
set -eu

./scripts/up-vault.sh

docker compose exec -T vault sh -lc \
  'VAULT_ADDR=http://127.0.0.1:8200 VAULT_TOKEN=root vault kv put secret/docker-course api_token=local-demo-token username=course-user'
