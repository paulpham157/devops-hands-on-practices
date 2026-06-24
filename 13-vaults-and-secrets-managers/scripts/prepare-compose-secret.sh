#!/usr/bin/env sh
set -eu

mkdir -p secrets

if [ ! -f secrets/demo_api_token.txt ]; then
  cp secrets/demo_api_token.example.txt secrets/demo_api_token.txt
  chmod 600 secrets/demo_api_token.txt
  echo "Created secrets/demo_api_token.txt from the example file."
fi
