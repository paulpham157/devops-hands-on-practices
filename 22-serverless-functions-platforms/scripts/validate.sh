#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh

for file in \
  platform-maps/serverless-platform-map.md \
  platform-maps/decision-matrix.md \
  notes/production-serverless.md \
  notes/observability-and-deployments.md \
  scenario-designs/image-resize.yml \
  scenario-designs/webhook-handler.yml; do
  test -s "$file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

ruby -e 'require "json"; ARGV.each { |f| JSON.parse(File.read(f)); puts "ok #{f}" }' \
  function-examples/azure-functions/function.json \
  function-examples/vercel/vercel.json \
  function-examples/gcp-functions/package.json

ruby -e 'require "yaml"; ARGV.each { |f| YAML.load_file(f); puts "ok #{f}" }' \
  function-examples/aws-lambda/template.yaml \
  scenario-designs/image-resize.yml \
  scenario-designs/webhook-handler.yml

if command -v node >/dev/null 2>&1; then
  node --check function-examples/aws-lambda/index.js
  node --check function-examples/azure-functions/index.js
  node --check function-examples/netlify/netlify/functions/hello.js
  node --check function-examples/gcp-functions/index.js
else
  echo "node not installed; skipping JavaScript syntax check"
fi

echo "Validation passed"
