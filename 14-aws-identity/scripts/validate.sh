#!/usr/bin/env sh
set -eu

required_files="
README.md
scripts/explain-policy.sh
scripts/simulate-access.sh
scripts/validate-json.sh
policies/identity-policies/s3-read-only.json
policies/identity-policies/deny-dangerous-iam-actions.json
policies/resource-policies/s3-bucket-read-for-role.json
policies/scp/deny-leaving-organization.json
policies/trust-policies/cross-account-audit-trust.json
policies/trust-policies/ec2-service-role-trust.json
policies/trust-policies/github-actions-oidc-trust.json
exercises/README.md
"

for file in $required_files; do
  test -f "$file"
  echo "ok $file"
done

find scripts -name '*.sh' ! -name validate.sh -exec sh -n {} \;
echo "ok shell scripts"

./scripts/validate-json.sh

echo "Validation passed"
