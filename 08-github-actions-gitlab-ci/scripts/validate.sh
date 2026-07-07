#!/usr/bin/env sh
set -eu

required_files="
README.md
github-actions/workflows/python-docker-ci.yml
github-actions/workflows/publish-ghcr.yml
gitlab-ci/.gitlab-ci.yml
sample-app/Dockerfile
sample-app/app.py
sample-app/requirements.txt
sample-app/requirements-dev.txt
sample-app/tests/test_app.py
scripts/run-local-ci.sh
exercises/README.md
"

for file in $required_files; do
  test -f "$file"
  echo "ok $file"
done

sh -n scripts/run-local-ci.sh
echo "ok scripts/run-local-ci.sh"

if command -v python3 >/dev/null 2>&1; then
  python3 -m py_compile sample-app/app.py sample-app/tests/test_app.py
  echo "ok sample app Python"
fi

echo "Validation passed"
