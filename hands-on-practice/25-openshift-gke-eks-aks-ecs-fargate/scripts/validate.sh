#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh

for file in \
  README.md \
  platform-maps/platform-comparison.md \
  platform-maps/operations-checklist.md \
  openshift/route.yaml \
  openshift/platform-features.md \
  kubernetes-manifests/deployment.yaml \
  kubernetes-manifests/service.yaml \
  ecs/task-definition.json \
  ecs/workload-model.md \
  scenario-designs/enterprise-platform.yml \
  scenario-designs/aws-app-team.yml \
  exercises/README.md; do
  test -s "$file"
done

ruby -e 'require "json"; ARGV.each { |f| JSON.parse(File.read(f)); puts "ok #{f}" }' \
  ecs/task-definition.json

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }' \
  openshift/route.yaml \
  kubernetes-manifests/deployment.yaml \
  kubernetes-manifests/service.yaml \
  scenario-designs/enterprise-platform.yml \
  scenario-designs/aws-app-team.yml

echo "Validation passed"

