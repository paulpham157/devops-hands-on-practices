#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh

for file in \
  README.md \
  AGENTS.md \
  CLAUDE.md \
  workspace-blueprints/generator-map.md \
  workspace-blueprints/local-workflow.md \
  scenario-designs/fullstack-cdk.yml \
  scenario-designs/agent-terraform.yml \
  exercises/README.md; do
  test -s "$file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }' \
  scenario-designs/fullstack-cdk.yml \
  scenario-designs/agent-terraform.yml

echo "Validation passed"
