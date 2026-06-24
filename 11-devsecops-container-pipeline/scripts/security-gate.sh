#!/usr/bin/env sh
set -eu

IMAGE_VULN_GATE="${IMAGE_VULN_GATE:-0}"

./scripts/lint-dockerfile.sh
./scripts/scan-secrets.sh
./scripts/scan-filesystem.sh
./scripts/build-image.sh

if [ "$IMAGE_VULN_GATE" = "1" ]; then
  EXIT_CODE=1 SEVERITY=CRITICAL ./scripts/scan-image.sh
else
  ./scripts/scan-image.sh
  echo "Image vulnerability scan is report-only. Set IMAGE_VULN_GATE=1 to fail on critical image findings."
fi

./scripts/generate-sbom.sh

echo "DevSecOps gate completed."
