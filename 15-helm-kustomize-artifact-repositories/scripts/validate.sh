#!/usr/bin/env sh
set -eu

required_files="
README.md
charts/course-web/Chart.yaml
charts/course-web/values.yaml
kustomize/base/kustomization.yaml
kustomize/overlays/dev/kustomization.yaml
kustomize/overlays/prod/kustomization.yaml
artifact-repositories/nexus/README.md
artifact-repositories/artifactory/README.md
exercises/README.md
"

for file in $required_files; do
  test -f "$file"
  echo "ok $file"
done

for variant in explainer problem solution; do
  count=$(find exercises -path "*/$variant/readme.md" -type f | wc -l | tr -d ' ')
  [ "$count" -ge 8 ]
  echo "ok exercises $variant readmes: $count"
done

sh -n scripts/*.sh

if command -v helm >/dev/null 2>&1; then
  helm lint charts/course-web
  ./scripts/render-helm.sh
  ./scripts/package-chart.sh
else
  echo "helm not installed; skipping Helm lint/template/package checks"
fi

if command -v kubectl >/dev/null 2>&1; then
  ./scripts/render-kustomize.sh dev
  ./scripts/render-kustomize.sh prod
else
  echo "kubectl not installed; skipping Kustomize checks"
fi

ruby -e 'require "yaml"; files = Dir["reports/*.yaml"] + Dir["kustomize/**/*.yaml"] + Dir["charts/course-web/Chart.yaml"] + Dir["charts/course-web/values*.yaml"]; files.each { |f| YAML.load_stream(File.read(f)); puts "ok #{f}" }'
