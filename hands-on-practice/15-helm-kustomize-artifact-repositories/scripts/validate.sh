#!/usr/bin/env sh
set -eu

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
