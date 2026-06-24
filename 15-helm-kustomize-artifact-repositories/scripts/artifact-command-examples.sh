#!/usr/bin/env sh
set -eu

cat <<'COMMANDS'
# Helm classic repository flow:
helm package charts/course-web --destination artifacts
curl -u "$REPO_USER:$REPO_PASSWORD" --upload-file artifacts/course-web-0.1.0.tgz \
  https://artifact.example.com/repository/helm-hosted/course-web-0.1.0.tgz

# Helm OCI flow:
helm registry login artifact.example.com
helm push artifacts/course-web-0.1.0.tgz oci://artifact.example.com/helm

# Docker image flow:
docker login artifact.example.com
docker tag course-web:1.0.0 artifact.example.com/docker/course-web:1.0.0
docker push artifact.example.com/docker/course-web:1.0.0
COMMANDS
