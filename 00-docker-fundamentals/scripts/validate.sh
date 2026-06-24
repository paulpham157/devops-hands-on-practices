#!/usr/bin/env sh
set -eu

required_files="
README.md
exercises/README.md
examples/docker-image-examples/nginx/Dockerfile
examples/docker-image-examples/python-flask/Dockerfile
examples/docker-image-examples/nonroot-user/Dockerfile
examples/multi-stage-builds/Dockerfile1
examples/multi-stage-builds/Dockerfile2
examples/multi-stage-builds/Dockerfile3
examples/optimize-docker-images/caching/Dockerfile3
examples/optimize-docker-images/caching/Dockerfile4
examples/lab-setup/Vagrantfile
"

for file in $required_files; do
  test -f "$file" || {
    echo "missing required file: $file" >&2
    exit 1
  }
done

for file in \
  examples/docker-image-examples/nginx/Dockerfile \
  examples/docker-image-examples/python-flask/Dockerfile \
  examples/docker-image-examples/nonroot-user/Dockerfile \
  examples/multi-stage-builds/Dockerfile1 \
  examples/multi-stage-builds/Dockerfile2 \
  examples/multi-stage-builds/Dockerfile3
do
  grep -q '^FROM ' "$file" || {
    echo "Dockerfile has no FROM instruction: $file" >&2
    exit 1
  }
done

echo "lesson 00 structure ok"
