#!/usr/bin/env sh
set -eu

docker compose up -d vault

for _ in $(seq 1 30); do
  if docker compose exec -T vault sh -lc 'VAULT_ADDR=http://127.0.0.1:8200 VAULT_TOKEN=root vault status' >/dev/null 2>&1; then
    echo "Vault is ready at http://localhost:8200"
    exit 0
  fi
  sleep 1
done

echo "Vault did not become ready in time" >&2
exit 1
