#!/usr/bin/env sh
set -eu

required_files="
README.md
compose.yaml
jenkins/Dockerfile
jenkins/plugins.txt
sample-app/Dockerfile
sample-app/Jenkinsfile
sample-app/app.py
sample-app/requirements.txt
sample-app/tests/test_app.py
exercises/README.md
"

for file in $required_files; do
  test -f "$file"
  echo "ok $file"
done

if command -v python3 >/dev/null 2>&1; then
  python3 -m py_compile sample-app/app.py sample-app/tests/test_app.py
  echo "ok sample app Python"
fi

if command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
  docker compose config -q
  echo "ok compose.yaml"
else
  echo "docker compose not available; skipping compose config check"
fi

echo "Validation passed"
