#!/usr/bin/env sh
set -eu

TRIVY_IMAGE="${TRIVY_IMAGE:-aquasec/trivy:0.72.0}"
EXIT_CODE="${EXIT_CODE:-1}"

mkdir -p .trivy-cache reports

docker run --rm \
  -v "$PWD:/workspace" \
  -w /workspace \
  -v "$PWD/.trivy-cache:/root/.cache/trivy" \
  "$TRIVY_IMAGE" fs \
  --scanners secret \
  --exit-code "$EXIT_CODE" \
  --skip-dirs .trivy-cache \
  --skip-dirs reports \
  .
