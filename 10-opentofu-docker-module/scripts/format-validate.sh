#!/usr/bin/env sh
set -eu

tofu fmt -recursive -check
tofu init -backend=false
tofu validate
