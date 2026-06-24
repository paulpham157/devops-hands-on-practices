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

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }' \
  architecture-scenarios/web-app.yml \
  architecture-scenarios/kubernetes-platform.yml

echo "Validation passed"

