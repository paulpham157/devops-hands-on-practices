#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
LESSON_DIR=$(dirname "$SCRIPT_DIR")
APP_PATH="$LESSON_DIR/gitops-repo/apps/course-web/overlays/dev"

command -v kubectl >/dev/null 2>&1 || {
  echo "kubectl is required" >&2
  exit 1
}

kubectl kustomize "$APP_PATH" >/tmp/docker-course-argocd-rendered.yaml
echo "Rendered Kustomize manifests successfully."
echo "Rendered output: /tmp/docker-course-argocd-rendered.yaml"
