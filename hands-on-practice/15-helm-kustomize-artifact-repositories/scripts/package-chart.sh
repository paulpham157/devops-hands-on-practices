#!/usr/bin/env sh
set -eu

mkdir -p artifacts
helm lint charts/course-web
helm package charts/course-web --destination artifacts
