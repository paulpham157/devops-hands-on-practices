#!/usr/bin/env sh
set -eu

sh -n scripts/*.sh
docker compose config >/tmp/docker-course-secrets-compose.yaml
ruby -e 'require "yaml"; Dir["kubernetes/*.yaml"].each { |f| YAML.load_stream(File.read(f)); puts "ok #{f}" }'
echo "Examples validated."
