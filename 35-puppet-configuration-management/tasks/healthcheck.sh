#!/usr/bin/env sh
set -eu

hostname
uptime
docker --version 2>/dev/null || true
