#!/usr/bin/env sh
set -eu

command -v kubectl >/dev/null 2>&1 || {
  echo "kubectl is required" >&2
  exit 1
}

kubectl port-forward svc/argocd-server -n argocd 8080:443
