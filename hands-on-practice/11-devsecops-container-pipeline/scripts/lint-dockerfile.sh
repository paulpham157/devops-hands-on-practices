#!/usr/bin/env sh
set -eu

HADOLINT_IMAGE="${HADOLINT_IMAGE:-hadolint/hadolint:latest}"

docker run --rm -i "$HADOLINT_IMAGE" < sample-app/Dockerfile
