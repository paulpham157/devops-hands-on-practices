#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh

for file in \
  README.md \
  pattern-maps/pipeline-pattern-comparison.md \
  pattern-maps/operations-checklist.md \
  ingestion/landing-zone-flow.yml \
  batch-vs-streaming/mode-comparison.yml \
  etl-elt/transformation-model.json \
  orchestration/dag.yml \
  quality-and-lineage/quality-policy.yml \
  quality-and-lineage/lineage-notes.md \
  scenario-designs/product-analytics.yml \
  scenario-designs/fraud-detection.yml \
  exercises/README.md; do
  test -s "$file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

ruby -e 'require "json"; ARGV.each { |f| JSON.parse(File.read(f)); puts "ok #{f}" }' \
  etl-elt/transformation-model.json

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }' \
  ingestion/landing-zone-flow.yml \
  batch-vs-streaming/mode-comparison.yml \
  orchestration/dag.yml \
  quality-and-lineage/quality-policy.yml \
  scenario-designs/product-analytics.yml \
  scenario-designs/fraud-detection.yml

echo "Validation passed"
