#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh

for file in sample-data/app.log sample-data/status-codes.txt sample-data/users.csv notes/linux-vs-unix.md notes/command-cheatsheet.md; do
  test -s "$file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

ruby -e 'require "yaml"; YAML.load_file("compose.yaml"); puts "ok compose.yaml"'

./scripts/text-pipeline-demo.sh >/tmp/linux-unix-text-pipeline-demo.out
grep "Errors:" /tmp/linux-unix-text-pipeline-demo.out >/dev/null
grep "Requests by status code:" /tmp/linux-unix-text-pipeline-demo.out >/dev/null

if command -v docker >/dev/null 2>&1; then
  docker compose config >/dev/null
else
  echo "docker not installed; skipping docker compose config"
fi

echo "Validation passed"
