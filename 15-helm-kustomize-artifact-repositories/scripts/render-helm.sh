#!/usr/bin/env sh
set -eu

mkdir -p reports
helm template course-web charts/course-web \
  --namespace docker-course-packaging \
  --create-namespace \
  -f charts/course-web/values-dev.yaml \
  > reports/helm-rendered.yaml

echo "Rendered reports/helm-rendered.yaml"
