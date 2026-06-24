#!/usr/bin/env sh
set -eu

find policies -type f -name '*.json' | sort | while IFS= read -r file; do
  ruby -rjson -e "JSON.parse(File.read(ARGV.fetch(0))); puts \"ok #{ARGV.fetch(0)}\"" "$file"
done
