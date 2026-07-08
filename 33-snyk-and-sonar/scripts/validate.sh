#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh snyk/*.sh

for file in \
  README.md \
  snyk/cli-workflow.sh \
  snyk/sample-results.json \
  sonar/sonar-project.properties \
  sonar/quality-gate.yml \
  ci-cd/github-actions.yml \
  policy-examples/pipeline-policy.yml \
  scenario-designs/fast-moving-product-team.yml \
  scenario-designs/platform-security-team.yml \
  exercises/README.md; do
  test -s "$file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

ruby -e 'require "json"; ARGV.each { |f| JSON.parse(File.read(f)); puts "ok #{f}" }' \
  snyk/sample-results.json

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }' \
  sonar/quality-gate.yml \
  ci-cd/github-actions.yml \
  policy-examples/pipeline-policy.yml \
  scenario-designs/fast-moving-product-team.yml \
  scenario-designs/platform-security-team.yml

echo "Validation passed"
