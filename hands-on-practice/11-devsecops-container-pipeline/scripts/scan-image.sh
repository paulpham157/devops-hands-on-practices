#!/usr/bin/env sh
set -eu

TRIVY_IMAGE="${TRIVY_IMAGE:-aquasec/trivy:latest}"
IMAGE_NAME="${IMAGE_NAME:-docker-course-devsecops:local}"
EXIT_CODE="${EXIT_CODE:-0}"
SEVERITY="${SEVERITY:-HIGH,CRITICAL}"

mkdir -p .trivy-cache reports

docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$PWD/.trivy-cache:/root/.cache/trivy" \
  "$TRIVY_IMAGE" image \
  --severity "$SEVERITY" \
  --ignore-unfixed \
  --exit-code "$EXIT_CODE" \
  "$IMAGE_NAME"
