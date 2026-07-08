#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh
python3 -m py_compile rest-api/app.py grpc-service/server.py grpc-service/client.py grpc-service/healthcheck.py

for file in \
  rest-api/openapi.yaml \
  protocol-specs/asyncapi.yaml \
  protocol-specs/schema.graphql \
  grpc-service/proto/catalog.proto \
  notes/protocol-selection.md \
  notes/versioning-security-observability.md; do
  test -s "$file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }' \
  compose.yaml \
  rest-api/openapi.yaml \
  protocol-specs/asyncapi.yaml

if command -v docker >/dev/null 2>&1; then
  docker compose config >/dev/null
else
  echo "docker not installed; skipping docker compose config"
fi

echo "Validation passed"
