#!/usr/bin/env sh
set -eu

required_files="
README.md
manifests/00-namespace.yaml
manifests/01-configmap.yaml
manifests/02-service-account.yaml
manifests/03-deployment.yaml
manifests/04-service.yaml
manifests/05-network-policy.yaml
exercises/README.md
"

for file in $required_files; do
  test -f "$file"
  echo "ok $file"
done

if command -v kubectl >/dev/null 2>&1 && kubectl cluster-info >/dev/null 2>&1; then
  kubectl apply --dry-run=client --validate=false -f manifests/ >/dev/null
  echo "ok manifests/"
else
  echo "kubectl cluster not available; skipping Kubernetes dry-run"
fi

echo "Validation passed"
