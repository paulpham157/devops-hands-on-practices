#!/usr/bin/env sh
set -eu

required_files="
README.md
docker-nginx.pkr.hcl
files/index.html
exercises/README.md
"

for file in $required_files; do
  test -f "$file"
  echo "ok $file"
done

if command -v packer >/dev/null 2>&1; then
  packer fmt -check .
  packer validate .
  echo "ok docker-nginx.pkr.hcl"
else
  echo "packer not available; skipping Packer checks"
fi

echo "Validation passed"
