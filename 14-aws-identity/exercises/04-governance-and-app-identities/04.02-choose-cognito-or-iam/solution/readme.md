# Solution: Choose Cognito or IAM

1. IAM role, because Lambda needs AWS API permissions.
2. Cognito, because this is an application end user.
3. IAM role through workload federation, because the controller needs AWS API access.
4. Cognito or another app identity provider, because this is app login federation.
5. IAM Identity Center or IAM role, because this is operator access to AWS resources.

The boundary is simple: IAM protects AWS APIs; Cognito manages app users.
