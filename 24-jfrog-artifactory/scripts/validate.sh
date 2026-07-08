#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh

for file in \
  README.md \
  repository-design/repositories.yml \
  repository-design/permission-targets.yml \
  repository-design/promotion-flow.yml \
  ci-cd/jfrog-cli-build-info.sh \
  ci-cd/github-actions-artifactory.yml \
  ci-cd/Jenkinsfile \
  policies/xray-watch-policy.yml \
  policies/retention-policy.yml \
  sample-package/package.json \
  sample-package/build-info.json \
  exercises/README.md; do
  test -s "$file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

ruby -e 'require "json"; ARGV.each { |f| JSON.parse(File.read(f)); puts "ok #{f}" }' \
  sample-package/package.json \
  sample-package/build-info.json

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }' \
  repository-design/repositories.yml \
  repository-design/permission-targets.yml \
  repository-design/promotion-flow.yml \
  ci-cd/github-actions-artifactory.yml \
  policies/xray-watch-policy.yml \
  policies/retention-policy.yml

echo "Validation passed"
