#!/usr/bin/env sh
set -eu

TRIVY_IMAGE="${TRIVY_IMAGE:-aquasec/trivy:latest}"
EXIT_CODE="${EXIT_CODE:-0}"
SEVERITY="${SEVERITY:-HIGH,CRITICAL}"

mkdir -p .trivy-cache reports

docker run --rm \
  -v "$PWD:/workspace" \
  -w /workspace \
  -v "$PWD/.trivy-cache:/root/.cache/trivy" \
  "$TRIVY_IMAGE" fs \
  --scanners vuln,misconfig,secret \
  --severity "$SEVERITY" \
  --ignore-unfixed \
  --exit-code "$EXIT_CODE" \
  --skip-dirs .trivy-cache \
  --skip-dirs reports \
  sample-app
