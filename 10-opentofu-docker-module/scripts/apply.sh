#!/usr/bin/env sh
set -eu

tofu init
tofu apply "$@"
tofu output
