#!/usr/bin/env sh
set -eu

check() {
  name="$1"
  url="$2"
  echo "Checking $name at $url"
  curl -fsS "$url/healthz" >/dev/null
  curl -fsS "$url/" | grep "$name" >/dev/null
  curl -fsS "$url/work" | grep "elapsed_ms" >/dev/null
}

check "python-flask" "http://localhost:5117"
check "java-spring" "http://localhost:5118"
check "ruby-sinatra" "http://localhost:5119"
check "go-http" "http://localhost:5120"
check "rust-http" "http://localhost:5121"

echo "All services passed smoke tests"

