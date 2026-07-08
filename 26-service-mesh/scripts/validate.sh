#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh

for file in \
  README.md \
  platform-maps/service-mesh-comparison.md \
  platform-maps/operations-checklist.md \
  istio/virtual-service.yaml \
  istio/destination-rule.yaml \
  istio/peer-authentication.yaml \
  istio/authorization-policy.yaml \
  linkerd/overview.md \
  linkerd/server-policy.yaml \
  linkerd/server-authorization.yaml \
  consul/overview.md \
  consul/service-intentions.yaml \
  scenario-designs/platform-team.yml \
  scenario-designs/hybrid-runtime.yml \
  exercises/README.md; do
  test -s "$file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }' \
  istio/virtual-service.yaml \
  istio/destination-rule.yaml \
  istio/peer-authentication.yaml \
  istio/authorization-policy.yaml \
  linkerd/server-policy.yaml \
  linkerd/server-authorization.yaml \
  consul/service-intentions.yaml \
  scenario-designs/platform-team.yml \
  scenario-designs/hybrid-runtime.yml

echo "Validation passed"
