#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh

for file in   README.md   AGENTS.md   CLAUDE.md   platform-maps/service-map.md   platform-maps/operations-checklist.md   heat/network-stack.yml   heat/instance-stack.yml   scenario-designs/private-cloud-platform.yml   scenario-designs/edge-region.yml   exercises/README.md; do
  test -s "$file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

ruby -e 'require "yaml"; ARGV.each { |f| YAML.parse_file(f); puts "ok #{f}" }'   heat/network-stack.yml   heat/instance-stack.yml   scenario-designs/private-cloud-platform.yml   scenario-designs/edge-region.yml

echo "Validation passed"
