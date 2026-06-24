#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh

for file in \
  README.md \
  pattern-maps/availability-pattern-comparison.md \
  pattern-maps/operations-checklist.md \
  health-monitoring/health-contract.json \
  health-monitoring/status-policy.yml \
  queue-load-leveling/order-processing-flow.yml \
  throttling/policy.yml \
  throttling/backpressure-notes.md \
  scenario-designs/checkout-spike.yml \
  scenario-designs/dependency-outage.yml \
  exercises/README.md; do
  test -s "$file"
done

ruby -e 'require "json"; ARGV.each { |f| JSON.parse(File.read(f)); puts "ok #{f}" }' \
  health-monitoring/health-contract.json

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }' \
  health-monitoring/status-policy.yml \
  queue-load-leveling/order-processing-flow.yml \
  throttling/policy.yml \
  scenario-designs/checkout-spike.yml \
  scenario-designs/dependency-outage.yml

echo "Validation passed"

