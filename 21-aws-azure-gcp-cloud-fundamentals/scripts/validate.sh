#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh cli-examples/*.sh

for file in \
  cloud-maps/service-map.md \
  cloud-maps/resource-hierarchy.md \
  architecture-scenarios/web-app.yml \
  architecture-scenarios/kubernetes-platform.yml \
  notes/cloud-design-principles.md \
  notes/tagging-and-cost.md; do
  test -s "$file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }' \
  architecture-scenarios/web-app.yml \
  architecture-scenarios/kubernetes-platform.yml

echo "Validation passed"
