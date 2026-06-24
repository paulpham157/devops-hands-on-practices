#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
LESSON_DIR=$(dirname "$SCRIPT_DIR")
CLUSTER_NAME="${CLUSTER_NAME:-docker-course-argocd}"

if command -v kubectl >/dev/null 2>&1; then
  kubectl delete application course-web -n argocd --ignore-not-found=true >/dev/null 2>&1 || true
  kubectl delete namespace docker-course-gitops --ignore-not-found=true >/dev/null 2>&1 || true
fi

rm -rf "$LESSON_DIR/reports"

if command -v k3d >/dev/null 2>&1; then
  k3d cluster delete "$CLUSTER_NAME"
fi
