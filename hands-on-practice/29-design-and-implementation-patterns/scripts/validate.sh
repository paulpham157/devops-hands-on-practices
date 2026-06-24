#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh

for file in \
  README.md \
  pattern-maps/pattern-comparison.md \
  pattern-maps/operations-checklist.md \
  strangler-fig/route-map.yml \
  strangler-fig/migration-notes.md \
  sidecar/pod.yaml \
  sidecar/responsibilities.md \
  anti-corruption-layer/translation-contract.json \
  anti-corruption-layer/adapter-flow.yml \
  scenario-designs/legacy-modernization.yml \
  scenario-designs/external-billing-integration.yml \
  exercises/README.md; do
  test -s "$file"
done

ruby -e 'require "json"; ARGV.each { |f| JSON.parse(File.read(f)); puts "ok #{f}" }' \
  anti-corruption-layer/translation-contract.json

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }' \
  strangler-fig/route-map.yml \
  sidecar/pod.yaml \
  anti-corruption-layer/adapter-flow.yml \
  scenario-designs/legacy-modernization.yml \
  scenario-designs/external-billing-integration.yml

echo "Validation passed"

