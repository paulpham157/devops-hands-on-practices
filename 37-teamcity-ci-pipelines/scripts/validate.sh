#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh
sh -n ci-cd/build-steps.sh

for file in   README.md   AGENTS.md   CLAUDE.md   build-configs/project-overview.md   build-configs/build-chain.md   build-configs/branch-policy.md   ci-cd/.teamcity/settings.kts   ci-cd/build-steps.sh   ci-cd/artifact-contract.txt   ci-cd/pull-request-flow.md   scenario-designs/release-train.yml   scenario-designs/self-hosted-agents.yml   exercises/README.md; do
  test -s "$file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }'   scenario-designs/release-train.yml   scenario-designs/self-hosted-agents.yml

echo "Validation passed"
