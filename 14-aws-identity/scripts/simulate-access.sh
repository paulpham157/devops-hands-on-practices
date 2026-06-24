#!/usr/bin/env sh
set -eu

ACTION="${1:-}"

if [ -z "$ACTION" ]; then
  echo "Usage: $0 <aws-action>" >&2
  echo "Example: $0 s3:GetObject" >&2
  exit 1
fi

ruby -rjson -e '
action = ARGV.fetch(0)
policy_files = [
  "policies/identity-policies/s3-read-only.json",
  "policies/identity-policies/deny-dangerous-iam-actions.json",
  "policies/scp/deny-leaving-organization.json"
]

def matches?(patterns, action)
  Array(patterns).any? do |pattern|
    regex = Regexp.new("\\A" + Regexp.escape(pattern).gsub("\\*", ".*") + "\\z", Regexp::IGNORECASE)
    regex.match?(action)
  end
end

decisions = []
policy_files.each do |file|
  policy = JSON.parse(File.read(file))
  Array(policy["Statement"]).each do |statement|
    next unless matches?(statement["Action"], action)
    decisions << [statement["Effect"], file, statement["Sid"]]
  end
end

deny = decisions.find { |effect, _, _| effect == "Deny" }
allow = decisions.find { |effect, _, _| effect == "Allow" }

if deny
  puts "DENIED by #{deny[1]} statement #{deny[2]}"
elsif allow
  puts "ALLOWED by #{allow[1]} statement #{allow[2]}"
else
  puts "IMPLICIT DENY: no matching Allow statement"
end
' "$ACTION"
