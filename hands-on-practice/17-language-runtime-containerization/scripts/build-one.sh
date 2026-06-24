#!/usr/bin/env sh
set -eu

SERVICE="${1:-}"

if [ -z "$SERVICE" ]; then
  echo "Usage: ./scripts/build-one.sh <service>" >&2
  echo "Services: python-flask java-spring ruby-sinatra go-http rust-http" >&2
  exit 1
fi

case "$SERVICE" in
  python-flask|java-spring|ruby-sinatra|go-http|rust-http)
    docker compose build "$SERVICE"
    ;;
  *)
    echo "Unknown service: $SERVICE" >&2
    echo "Services: python-flask java-spring ruby-sinatra go-http rust-http" >&2
    exit 1
    ;;
esac

