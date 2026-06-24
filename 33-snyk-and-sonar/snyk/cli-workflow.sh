#!/usr/bin/env sh
set -eu

echo "Example Snyk workflow"
echo "snyk test"
echo "snyk container test sample-app:latest"
echo "snyk iac test infra/"
echo "snyk monitor"

