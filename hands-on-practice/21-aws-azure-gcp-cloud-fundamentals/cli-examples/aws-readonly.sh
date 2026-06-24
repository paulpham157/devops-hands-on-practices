#!/usr/bin/env sh
set -eu

echo "These commands require AWS CLI and credentials."
echo "They are read-only examples."

cat <<'COMMANDS'
aws sts get-caller-identity
aws configure list
aws ec2 describe-regions --output table
aws s3 ls
aws ec2 describe-vpcs --output table
aws resourcegroupstaggingapi get-resources --output table
COMMANDS

