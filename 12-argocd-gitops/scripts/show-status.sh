#!/usr/bin/env sh
set -eu

command -v kubectl >/dev/null 2>&1 || {
  echo "kubectl is required" >&2
  exit 1
}

kubectl get applications.argoproj.io course-web -n argocd || true
kubectl get all,ingress -n docker-course-gitops || true
kubectl -n argocd describe application course-web || true
