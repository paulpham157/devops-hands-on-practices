#!/usr/bin/env sh
set -eu

ARGOCD_VERSION="${ARGOCD_VERSION:-stable}"
ARGOCD_MANIFEST_URL="https://raw.githubusercontent.com/argoproj/argo-cd/${ARGOCD_VERSION}/manifests/install.yaml"

command -v kubectl >/dev/null 2>&1 || {
  echo "kubectl is required" >&2
  exit 1
}

kubectl create namespace argocd --dry-run=client -o yaml | kubectl apply -f -
kubectl apply --server-side --force-conflicts -n argocd -f "$ARGOCD_MANIFEST_URL"
kubectl rollout status deployment/argocd-server -n argocd --timeout=5m
kubectl rollout status deployment/argocd-repo-server -n argocd --timeout=5m
kubectl rollout status statefulset/argocd-application-controller -n argocd --timeout=5m
