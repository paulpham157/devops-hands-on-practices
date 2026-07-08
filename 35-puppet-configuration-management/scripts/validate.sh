#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh

for file in   README.md   AGENTS.md   CLAUDE.md   Puppetfile   manifests/site.pp   modules/profile/manifests/base.pp   modules/role/manifests/docker_host.pp   hiera.yaml   data/common.yaml   data/environments/production.yaml   plans/remediate.pp   tasks/healthcheck.sh   scenario-designs/regulated-fleet.yml   scenario-designs/hybrid-estate.yml   exercises/README.md; do
  test -s "$file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }'   hiera.yaml   data/common.yaml   data/environments/production.yaml   scenario-designs/regulated-fleet.yml   scenario-designs/hybrid-estate.yml

echo "Validation passed"
