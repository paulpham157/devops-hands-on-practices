#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh

for file in \
  README.md \
  pattern-maps/bff-comparison.md \
  pattern-maps/operations-checklist.md \
  bff-web/dashboard-response.json \
  bff-mobile/mobile-response-shape.yml \
  bff-shared-services/aggregation-flow.yml \
  bff-shared-services/auth-and-cache-notes.md \
  scenario-designs/web-mobile-split.yml \
  scenario-designs/shared-gateway-only.yml \
  exercises/README.md; do
  test -s "$file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

ruby -e 'require "json"; ARGV.each { |f| JSON.parse(File.read(f)); puts "ok #{f}" }' \
  bff-web/dashboard-response.json

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }' \
  bff-mobile/mobile-response-shape.yml \
  bff-shared-services/aggregation-flow.yml \
  scenario-designs/web-mobile-split.yml \
  scenario-designs/shared-gateway-only.yml

echo "Validation passed"
