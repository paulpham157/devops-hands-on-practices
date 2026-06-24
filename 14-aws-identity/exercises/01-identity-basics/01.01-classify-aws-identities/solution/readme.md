# Solution: Classify AWS Identities

1. IAM Identity Center.
2. IAM role, usually through an EC2 instance profile.
3. OIDC federated role.
4. Cognito user.
5. Root user.
6. IAM user.

The safer default is to avoid long-lived access keys and use federation or role-based temporary credentials.
