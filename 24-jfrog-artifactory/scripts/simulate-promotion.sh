#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
SANDBOX_DIR="$ROOT_DIR/sandbox"
BUILD_NUMBER="${BUILD_NUMBER:-1}"
ARTIFACT_NAME="sample-service-${BUILD_NUMBER}.tgz"

rm -rf "$SANDBOX_DIR"
mkdir -p \
  "$SANDBOX_DIR/generic-dev-local/sample-service/${BUILD_NUMBER}" \
  "$SANDBOX_DIR/generic-staging-local/sample-service/${BUILD_NUMBER}" \
  "$SANDBOX_DIR/generic-release-local/sample-service/${BUILD_NUMBER}" \
  "$SANDBOX_DIR/build-info"

tar -czf "$SANDBOX_DIR/generic-dev-local/sample-service/${BUILD_NUMBER}/${ARTIFACT_NAME}" \
  -C "$ROOT_DIR/sample-package" package.json build-info.json

cp "$ROOT_DIR/sample-package/build-info.json" "$SANDBOX_DIR/build-info/sample-service-${BUILD_NUMBER}.json"

cp "$SANDBOX_DIR/generic-dev-local/sample-service/${BUILD_NUMBER}/${ARTIFACT_NAME}" \
  "$SANDBOX_DIR/generic-staging-local/sample-service/${BUILD_NUMBER}/${ARTIFACT_NAME}"

cp "$SANDBOX_DIR/generic-staging-local/sample-service/${BUILD_NUMBER}/${ARTIFACT_NAME}" \
  "$SANDBOX_DIR/generic-release-local/sample-service/${BUILD_NUMBER}/${ARTIFACT_NAME}"

cat > "$SANDBOX_DIR/promotion-summary.txt" <<EOF
Build: sample-service/${BUILD_NUMBER}
Published: generic-dev-local/sample-service/${BUILD_NUMBER}/${ARTIFACT_NAME}
Promoted: generic-staging-local/sample-service/${BUILD_NUMBER}/${ARTIFACT_NAME}
Released: generic-release-local/sample-service/${BUILD_NUMBER}/${ARTIFACT_NAME}
Rule: promote the same tested artifact; do not rebuild for release.
EOF

cat "$SANDBOX_DIR/promotion-summary.txt"

