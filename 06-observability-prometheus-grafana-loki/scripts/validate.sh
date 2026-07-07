#!/usr/bin/env sh
set -eu

required_files="
README.md
compose.yaml
app/Dockerfile
app/app.py
app/requirements.txt
prometheus/prometheus.yml
prometheus/rules/course-app.yml
loki/local-config.yaml
alloy/config.alloy
grafana/dashboards/docker-course-observability.json
exercises/README.md
"

for file in $required_files; do
  test -f "$file"
  echo "ok $file"
done

if grep -R "promtail" README.md compose.yaml alloy prometheus loki grafana >/dev/null 2>&1; then
  echo "promtail reference found; this lesson should use Grafana Alloy" >&2
  exit 1
fi

if command -v python3 >/dev/null 2>&1; then
  python3 -m py_compile app/app.py
  python3 -m json.tool grafana/dashboards/docker-course-observability.json >/dev/null
  echo "ok Python and Grafana dashboard JSON"
fi

if command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
  docker compose config -q
  echo "ok compose.yaml"
else
  echo "docker compose not available; skipping compose config check"
fi

echo "Validation passed"
