#!/usr/bin/env sh
set -eu

mkdir -p secrets

docker compose exec -T vault sh -lc \
  'VAULT_ADDR=http://127.0.0.1:8200 VAULT_TOKEN=root vault kv get -field=api_token secret/docker-course' \
  > secrets/demo_api_token.txt

chmod 600 secrets/demo_api_token.txt
echo "Wrote secrets/demo_api_token.txt from Vault. This generated file is ignored by git."
