#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
LESSON_DIR=$(dirname "$SCRIPT_DIR")
CLUSTER_NAME="${CLUSTER_NAME:-docker-course-k3s}"

if command -v kubectl >/dev/null 2>&1; then
  kubectl delete -f "$LESSON_DIR/manifests/" --ignore-not-found=true >/dev/null 2>&1 || true
fi

if command -v k3d >/dev/null 2>&1; then
  k3d cluster delete "$CLUSTER_NAME"
fi
