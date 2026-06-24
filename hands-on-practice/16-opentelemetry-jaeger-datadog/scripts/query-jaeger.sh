#!/usr/bin/env sh
set -eu

JAEGER_URL="${JAEGER_URL:-http://localhost:16686}"
SERVICE="${SERVICE:-course-otel-app}"

curl -fsS "$JAEGER_URL/api/traces?service=$SERVICE&limit=5" |
  if command -v jq >/dev/null 2>&1; then
    jq '.data[] | {traceID: .traceID, spans: (.spans | length)}'
  else
    sed -n '1,20p'
  fi

