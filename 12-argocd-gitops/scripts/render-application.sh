#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
LESSON_DIR=$(dirname "$SCRIPT_DIR")
TEMPLATE="$LESSON_DIR/argocd/applications/course-web.yaml.tpl"
OUTPUT_DIR="$LESSON_DIR/reports"
OUTPUT_FILE="$OUTPUT_DIR/course-web-application.yaml"

REPO_URL="${REPO_URL:-}"
TARGET_REVISION="${TARGET_REVISION:-main}"
APP_PATH="${APP_PATH:-12-argocd-gitops/gitops-repo/apps/course-web/overlays/dev}"

if [ -z "$REPO_URL" ]; then
  echo "REPO_URL is required, for example:" >&2
  echo "REPO_URL=https://github.com/YOUR_ORG/devops-hands-on-practices.git ./scripts/render-application.sh" >&2
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

sed \
  -e "s|__REPO_URL__|$REPO_URL|g" \
  -e "s|__TARGET_REVISION__|$TARGET_REVISION|g" \
  -e "s|__APP_PATH__|$APP_PATH|g" \
  "$TEMPLATE" > "$OUTPUT_FILE"

echo "Rendered $OUTPUT_FILE"
