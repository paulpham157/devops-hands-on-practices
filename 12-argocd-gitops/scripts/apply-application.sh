#!/usr/bin/env sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
LESSON_DIR=$(dirname "$SCRIPT_DIR")
APPLICATION_FILE="$LESSON_DIR/reports/course-web-application.yaml"

command -v kubectl >/dev/null 2>&1 || {
  echo "kubectl is required" >&2
  exit 1
}

"$SCRIPT_DIR/render-application.sh"
kubectl apply -f "$APPLICATION_FILE"
