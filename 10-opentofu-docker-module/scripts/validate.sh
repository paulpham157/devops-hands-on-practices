#!/usr/bin/env sh
set -eu

required_files="
README.md
main.tf
variables.tf
outputs.tf
versions.tf
modules/nginx_site/main.tf
modules/nginx_site/variables.tf
modules/nginx_site/outputs.tf
tests/plan.tftest.hcl
scripts/format-validate.sh
scripts/test.sh
exercises/README.md
"

for file in $required_files; do
  test -f "$file"
  echo "ok $file"
done

find scripts -name '*.sh' ! -name validate.sh -exec sh -n {} \;
echo "ok shell scripts"

if command -v tofu >/dev/null 2>&1; then
  tofu fmt -check -recursive
  if [ -d .terraform ]; then
    tofu validate
  else
    echo ".terraform not present; skipping tofu validate"
  fi
  echo "ok OpenTofu files"
else
  echo "tofu not available; skipping OpenTofu checks"
fi

echo "Validation passed"
