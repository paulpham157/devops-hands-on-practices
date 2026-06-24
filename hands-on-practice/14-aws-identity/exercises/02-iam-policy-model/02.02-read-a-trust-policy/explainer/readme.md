# Explainer: Read a Trust Policy

A trust policy answers who can assume a role.

It does not define what the role can do after it is assumed. That comes from permission policies attached to the role.

Common trusted principals:

- AWS account or role
- AWS service principal
- SAML provider
- OIDC provider

For CI/CD federation, trust policies should restrict repository, branch, audience, and provider conditions.
