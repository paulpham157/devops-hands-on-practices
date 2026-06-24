#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh

for file in \
  README.md \
  pattern-maps/service-level-comparison.md \
  pattern-maps/operations-checklist.md \
  sli-models/checkout-sli.json \
  sli-models/search-sli.yml \
  slo-policies/checkout-slo.yml \
  slo-policies/error-budget-policy.yml \
  sla-contracts/customer-availability.yml \
  scenario-designs/ecommerce-critical-path.yml \
  scenario-designs/internal-platform.yml \
  exercises/README.md; do
  test -s "$file"
done

ruby -e 'require "json"; ARGV.each { |f| JSON.parse(File.read(f)); puts "ok #{f}" }' \
  sli-models/checkout-sli.json

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }' \
  sli-models/search-sli.yml \
  slo-policies/checkout-slo.yml \
  slo-policies/error-budget-policy.yml \
  sla-contracts/customer-availability.yml \
  scenario-designs/ecommerce-critical-path.yml \
  scenario-designs/internal-platform.yml

echo "Validation passed"

