#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh
python3 -m py_compile apps/python-flask/app.py

if [ "${RUN_TOOLCHAIN_VALIDATION:-0}" = "1" ] && command -v go >/dev/null 2>&1; then
  (cd apps/go-http && go test ./...)
else
  echo "skipping Go compile check; run with RUN_TOOLCHAIN_VALIDATION=1 to enable"
fi

if [ "${RUN_TOOLCHAIN_VALIDATION:-0}" = "1" ] && command -v ruby >/dev/null 2>&1; then
  ruby -c apps/ruby-sinatra/app.rb
else
  echo "skipping Ruby syntax check; run with RUN_TOOLCHAIN_VALIDATION=1 to enable"
fi

if [ "${RUN_TOOLCHAIN_VALIDATION:-0}" = "1" ] && command -v cargo >/dev/null 2>&1; then
  (cd apps/rust-http && cargo check)
else
  echo "skipping Rust check; run with RUN_TOOLCHAIN_VALIDATION=1 to enable"
fi

if [ "${RUN_TOOLCHAIN_VALIDATION:-0}" = "1" ] && [ "${RUN_SLOW_VALIDATION:-0}" = "1" ] && command -v mvn >/dev/null 2>&1; then
  (cd apps/java-spring && mvn -q -DskipTests compile)
else
  echo "skipping Java compile check; run with RUN_TOOLCHAIN_VALIDATION=1 RUN_SLOW_VALIDATION=1 to enable Maven"
fi

ruby -e 'require "yaml"; YAML.load_file("compose.yaml"); puts "ok compose.yaml"'

if command -v docker >/dev/null 2>&1; then
  docker compose config >/dev/null
else
  echo "docker not installed; skipping docker compose config"
fi

echo "Validation passed"
