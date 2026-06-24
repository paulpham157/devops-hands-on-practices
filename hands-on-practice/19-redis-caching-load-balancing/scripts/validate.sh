#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh
python3 -m py_compile app/app.py

for file in compose.yaml nginx/default.conf redis/redis.conf notes/cache-and-load-balancing.md notes/failure-modes.md; do
  test -s "$file"
done

ruby -e 'require "yaml"; YAML.load_file("compose.yaml"); puts "ok compose.yaml"'

if command -v docker >/dev/null 2>&1; then
  docker compose config >/dev/null
else
  echo "docker not installed; skipping docker compose config"
fi

echo "Validation passed"

