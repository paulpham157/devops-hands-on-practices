#!/usr/bin/env sh
set -eu

HADOLINT_IMAGE="${HADOLINT_IMAGE:-ghcr.io/hadolint/hadolint:v2.14.0-debian}"

docker run --rm -i "$HADOLINT_IMAGE" < sample-app/Dockerfile
