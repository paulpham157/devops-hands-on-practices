# Solution: Choose Human vs Workload Identity

1. IAM Identity Center permission set. Risk: over-broad group assignment.
2. Lambda execution role. Risk: policy allows too many DynamoDB actions or resources.
3. GitHub Actions OIDC role. Risk: trust policy accepts too many repos or branches.
4. Cross-account IAM role with external ID or IAM Identity Center guest workflow. Risk: access not revoked after the audit.
5. Amazon Cognito or another customer identity provider. Risk: confusing app users with AWS operator identities.
