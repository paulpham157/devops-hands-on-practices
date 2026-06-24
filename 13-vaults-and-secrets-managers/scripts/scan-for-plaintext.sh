#!/usr/bin/env sh
set -eu

rg -n \
  "AKIA[0-9A-Z]{16}|BEGIN (RSA|OPENSSH|PRIVATE) KEY|ghp_[A-Za-z0-9_]{36}|xox[baprs]-[A-Za-z0-9-]+" \
  --glob '!secrets/demo_api_token.txt' \
  --glob '!reports/**' \
  . || {
    echo "No obvious plaintext cloud/API credential patterns found."
    exit 0
  }

echo "Possible plaintext secret found. Inspect the matches above." >&2
exit 1
