#!/usr/bin/env sh
set -eu

required_files="
README.md
ci/github-actions-devsecops.yml
sample-app/Dockerfile
sample-app/app.py
scripts/build-image.sh
scripts/generate-sbom.sh
scripts/lint-dockerfile.sh
scripts/scan-filesystem.sh
scripts/scan-image.sh
scripts/scan-secrets.sh
scripts/security-gate.sh
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

echo "Validation passed"
