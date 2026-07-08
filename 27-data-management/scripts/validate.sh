#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh

for file in \
  README.md \
  pattern-maps/data-pattern-comparison.md \
  pattern-maps/operations-checklist.md \
  consistency-models/read-consistency.md \
  partitioning/customer-events-partitions.yml \
  cqrs-event-sourcing/cqrs-flow.yml \
  cqrs-event-sourcing/order-events.json \
  saga-sync/order-saga.yml \
  saga-sync/synchronization-notes.md \
  scenario-designs/ecommerce-platform.yml \
  scenario-designs/analytics-pipeline.yml \
  exercises/README.md; do
  test -s "$file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

ruby -e 'require "json"; ARGV.each { |f| JSON.parse(File.read(f)); puts "ok #{f}" }' \
  cqrs-event-sourcing/order-events.json

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }' \
  partitioning/customer-events-partitions.yml \
  cqrs-event-sourcing/cqrs-flow.yml \
  saga-sync/order-saga.yml \
  scenario-designs/ecommerce-platform.yml \
  scenario-designs/analytics-pipeline.yml

echo "Validation passed"
