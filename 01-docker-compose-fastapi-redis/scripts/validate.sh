#!/usr/bin/env sh
set -eu

required_files="
README.md
compose.yaml
Dockerfile
app/app.py
app/requirements.txt
app/templates/index.html
exercises/README.md
"

for file in $required_files; do
  test -f "$file"
  echo "ok $file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

if command -v python3 >/dev/null 2>&1; then
  python3 -m py_compile app/app.py
  echo "ok app/app.py"
fi

if command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
  docker compose config -q
  echo "ok compose.yaml"
else
  echo "docker compose not available; skipping compose config check"
fi

echo "Validation passed"
