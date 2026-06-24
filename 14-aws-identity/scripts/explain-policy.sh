#!/usr/bin/env sh
set -eu

POLICY_FILE="${1:-}"

if [ -z "$POLICY_FILE" ]; then
  echo "Usage: $0 <policy-json-file>" >&2
  exit 1
fi

ruby -rjson -e '
policy = JSON.parse(File.read(ARGV.fetch(0)))
puts "Version: #{policy["Version"]}"
Array(policy["Statement"]).each_with_index do |statement, index|
  puts
  puts "Statement #{index + 1}"
  puts "  Sid: #{statement["Sid"] || "(none)"}"
  puts "  Effect: #{statement["Effect"]}"
  puts "  Action: #{Array(statement["Action"]).join(", ")}"
  resources = statement.key?("Resource") ? Array(statement["Resource"]).join(", ") : "(not used)"
  puts "  Resource: #{resources}"
  if statement["Principal"]
    puts "  Principal: #{statement["Principal"]}"
  end
  if statement["Condition"]
    puts "  Condition: #{statement["Condition"]}"
  end
end
' "$POLICY_FILE"
