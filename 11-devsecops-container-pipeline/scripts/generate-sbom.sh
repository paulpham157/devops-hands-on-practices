#!/usr/bin/env sh
set -eu

TRIVY_IMAGE="${TRIVY_IMAGE:-aquasec/trivy:0.72.0}"
IMAGE_NAME="${IMAGE_NAME:-docker-course-devsecops:local}"
SBOM_FILE="${SBOM_FILE:-reports/devsecops-sbom.cdx.json}"

mkdir -p .trivy-cache reports

docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "$PWD:/workspace" \
  -w /workspace \
  -v "$PWD/.trivy-cache:/root/.cache/trivy" \
  "$TRIVY_IMAGE" image \
  --format cyclonedx \
  --output "$SBOM_FILE" \
  "$IMAGE_NAME"

echo "SBOM written to $SBOM_FILE"
