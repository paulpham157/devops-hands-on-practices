#!/usr/bin/env sh
set -eu

CLUSTER_NAME="${CLUSTER_NAME:-docker-course-argocd}"
HTTP_PORT="${HTTP_PORT:-8099}"
HTTPS_PORT="${HTTPS_PORT:-8445}"

command -v docker >/dev/null 2>&1 || {
  echo "docker is required" >&2
  exit 1
}

command -v k3d >/dev/null 2>&1 || {
  echo "k3d is required. Install it before running this lesson." >&2
  exit 1
}

command -v kubectl >/dev/null 2>&1 || {
  echo "kubectl is required" >&2
  exit 1
}

if k3d cluster list "$CLUSTER_NAME" >/dev/null 2>&1; then
  echo "Cluster already exists: $CLUSTER_NAME"
else
  k3d cluster create "$CLUSTER_NAME" \
    --agents 1 \
    --port "${HTTP_PORT}:80@loadbalancer" \
    --port "${HTTPS_PORT}:443@loadbalancer" \
    --wait
fi

kubectl config use-context "k3d-$CLUSTER_NAME"
kubectl cluster-info
kubectl get nodes -o wide
