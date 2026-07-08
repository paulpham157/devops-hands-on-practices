#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh

for file in \
  README.md \
  pattern-maps/network-pattern-comparison.md \
  pattern-maps/operations-checklist.md \
  gateway-patterns/route-map.yml \
  gateway-patterns/aggregation-flow.yml \
  ambassador/outbound-access.yml \
  ambassador/responsibilities.md \
  gatekeeper/policy.yml \
  valet-key/token-flow.json \
  static-content/delivery-notes.md \
  scenario-designs/mobile-dashboard.yml \
  scenario-designs/document-download.yml \
  exercises/README.md; do
  test -s "$file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

ruby -e 'require "json"; ARGV.each { |f| JSON.parse(File.read(f)); puts "ok #{f}" }' \
  valet-key/token-flow.json

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }' \
  gateway-patterns/route-map.yml \
  gateway-patterns/aggregation-flow.yml \
  ambassador/outbound-access.yml \
  gatekeeper/policy.yml \
  scenario-designs/mobile-dashboard.yml \
  scenario-designs/document-download.yml

echo "Validation passed"
