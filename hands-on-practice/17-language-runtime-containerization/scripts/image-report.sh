#!/usr/bin/env sh
set -eu

docker compose images

echo
echo "Tip: compare runtime image size, exposed port, and Dockerfile pattern for each service."

