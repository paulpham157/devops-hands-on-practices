#!/usr/bin/env sh
set -eu

tofu init -backend=false
tofu test
