#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh

for file in   README.md   AGENTS.md   CLAUDE.md   cookbooks/base/metadata.rb   cookbooks/base/recipes/default.rb   cookbooks/docker_host/metadata.rb   cookbooks/docker_host/attributes/default.rb   cookbooks/docker_host/recipes/default.rb   cookbooks/docker_host/templates/default/daemon.json.erb   .kitchen.yml   policyfiles/Policyfile.rb   policyfiles/Policyfile.lock.json   policyfiles/production.rb   test/integration/default/controls/default.rb   scenario-designs/retail-platform.yml   scenario-designs/migration-team.yml   exercises/README.md; do
  test -s "$file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }'   .kitchen.yml   scenario-designs/retail-platform.yml   scenario-designs/migration-team.yml

ruby -e 'require "json"; ARGV.each { |f| JSON.parse(File.read(f)); puts "ok #{f}" }'   policyfiles/Policyfile.lock.json

echo "Validation passed"
