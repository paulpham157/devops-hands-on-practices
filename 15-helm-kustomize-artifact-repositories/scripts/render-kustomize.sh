#!/usr/bin/env sh
set -eu

ENVIRONMENT="${1:-dev}"
OVERLAY="kustomize/overlays/$ENVIRONMENT"

if [ ! -d "$OVERLAY" ]; then
  echo "Unknown overlay: $ENVIRONMENT" >&2
  echo "Expected one of: dev, prod" >&2
  exit 1
fi

mkdir -p reports
kubectl kustomize "$OVERLAY" > "reports/kustomize-$ENVIRONMENT.yaml"
echo "Rendered reports/kustomize-$ENVIRONMENT.yaml"
