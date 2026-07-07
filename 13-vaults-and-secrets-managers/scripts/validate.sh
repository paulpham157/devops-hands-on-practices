#!/usr/bin/env sh
set -eu

required_files="
README.md
compose.yaml
kubernetes/native-secret.yaml
kubernetes/external-secret-vault.yaml
kubernetes/sealed-secret-placeholder.yaml
sample-app/Dockerfile
sample-app/app.py
secrets/demo_api_token.example.txt
vault/policies/course-app-read.hcl
scripts/validate-examples.sh
exercises/README.md
"

for file in $required_files; do
  test -f "$file"
  echo "ok $file"
done

find scripts -name '*.sh' ! -name validate.sh -exec sh -n {} \;
echo "ok shell scripts"

if command -v python3 >/dev/null 2>&1; then
  python3 -m py_compile sample-app/app.py
  echo "ok sample app Python"
fi

./scripts/validate-examples.sh

if command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
  docker compose config -q
  echo "ok compose.yaml"
else
  echo "docker compose not available; skipping compose config check"
fi

echo "Validation passed"
