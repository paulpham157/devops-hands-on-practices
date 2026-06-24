#!/usr/bin/env sh
set -eu

IMAGE_NAME="${IMAGE_NAME:-docker-course-devsecops:local}"
HOST_PORT="${HOST_PORT:-8098}"

docker run --rm -p "$HOST_PORT:8080" "$IMAGE_NAME"
