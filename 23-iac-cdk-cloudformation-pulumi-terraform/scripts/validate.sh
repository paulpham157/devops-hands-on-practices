#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh

for file in \
  README.md \
  cloudformation/s3-bucket.yaml \
  aws-cdk/README.md \
  aws-cdk/app.ts \
  aws-cdk/package.json \
  pulumi/README.md \
  pulumi/Pulumi.yaml \
  pulumi/index.ts \
  pulumi/package.json \
  terraform/main.tf \
  terraform/variables.tf \
  terraform/outputs.tf \
  terraform/versions.tf \
  terraform/extensions/README.md \
  platform-maps/iac-tool-comparison.md \
  platform-maps/production-review-checklist.md \
  scenario-designs/aws-platform-team.yml \
  scenario-designs/multicloud-product-team.yml \
  exercises/README.md; do
  test -s "$file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

ruby -e 'require "json"; ARGV.each { |f| JSON.parse(File.read(f)); puts "ok #{f}" }' \
  aws-cdk/package.json \
  pulumi/package.json

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }' \
  cloudformation/s3-bucket.yaml \
  pulumi/Pulumi.yaml \
  scenario-designs/aws-platform-team.yml \
  scenario-designs/multicloud-product-team.yml

if command -v terraform >/dev/null 2>&1; then
  terraform -chdir=terraform fmt -check -recursive
elif command -v tofu >/dev/null 2>&1; then
  tofu -chdir=terraform fmt -check -recursive
else
  echo "terraform/tofu not installed; skipping HCL format check"
fi

echo "Validation passed"
