# Explainer: Classify AWS Identities

AWS has several identity shapes.

IAM users are identities inside one AWS account. They can have passwords and long-lived access keys.

IAM roles are assumable identities. They issue temporary credentials through STS.

IAM Identity Center is for workforce access across accounts through SSO and permission sets.

AWS service principals are AWS services that can assume roles.

Federated identities come from an external identity provider through SAML, OIDC, or web identity federation.

Cognito users are application end users, not AWS operators.
