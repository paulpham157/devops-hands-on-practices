#!/usr/bin/env sh
set -eu

required_files="
README.md
main.tf
variables.tf
outputs.tf
versions.tf
exercises/README.md
"

for file in $required_files; do
  test -f "$file"
  echo "ok $file"
done

if command -v terraform >/dev/null 2>&1; then
  terraform fmt -check -recursive
  if [ -d .terraform ]; then
    terraform validate
  else
    echo ".terraform not present; skipping terraform validate"
  fi
  echo "ok Terraform files"
else
  echo "terraform not available; skipping Terraform checks"
fi

echo "Validation passed"
