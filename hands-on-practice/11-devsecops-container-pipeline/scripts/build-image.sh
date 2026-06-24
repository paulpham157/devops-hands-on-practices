#!/usr/bin/env sh
set -eu

IMAGE_NAME="${IMAGE_NAME:-docker-course-devsecops:local}"

docker build -t "$IMAGE_NAME" sample-app
