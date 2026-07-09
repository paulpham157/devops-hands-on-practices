#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh

for file in \
  README.md \
  AGENTS.md \
  CLAUDE.md \
  workspace-maps/mental-model.md \
  workspace-maps/command-map.md \
  workspace-maps/ci-workflow.md \
  workspace-maps/nx-json-and-boundaries.md \
  plugin-catalog/plugin-selection.md \
  plugin-catalog/custom-plugin-notes.md \
  scenario-designs/web-platform.yml \
  scenario-designs/polyglot-platform.yml \
  exercises/README.md; do
  test -s "$file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }' \
  scenario-designs/web-platform.yml \
  scenario-designs/polyglot-platform.yml

echo "Validation passed"
