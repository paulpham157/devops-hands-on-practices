#!/usr/bin/env sh
set -eu

./scripts/render-helm.sh
./scripts/render-kustomize.sh dev

echo "Helm rendered resource kinds:"
grep '^kind:' reports/helm-rendered.yaml

echo
echo "Kustomize rendered resource kinds:"
grep '^kind:' reports/kustomize-dev.yaml
