#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
LESSON_DIR=$(dirname "$SCRIPT_DIR")
NAMESPACE="${NAMESPACE:-docker-course-k3s}"

kubectl apply -f "$LESSON_DIR/manifests/"
kubectl rollout status deployment/k3s-demo -n "$NAMESPACE"
kubectl get all,ingress,networkpolicy -n "$NAMESPACE"
