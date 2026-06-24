#!/usr/bin/env sh
set -eu

tofu init
tofu plan -out=tfplan "$@"
