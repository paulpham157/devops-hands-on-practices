#!/usr/bin/env sh
set -eu

echo "These commands require Google Cloud CLI and login."
echo "They are read-only examples."

cat <<'COMMANDS'
gcloud auth list
gcloud config list
gcloud projects list
gcloud compute regions list
gcloud compute networks list
gcloud asset search-all-resources --scope=projects/PROJECT_ID
COMMANDS

