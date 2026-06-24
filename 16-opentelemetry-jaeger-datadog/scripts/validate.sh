#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh
python3 -m py_compile app/app.py

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }' \
  compose.yaml \
  otel/collector.yaml \
  datadog/otel-collector-datadog.yaml

if command -v docker >/dev/null 2>&1; then
  docker compose config >/dev/null
else
  echo "docker not installed; skipping docker compose config"
fi

echo "Validation passed"

