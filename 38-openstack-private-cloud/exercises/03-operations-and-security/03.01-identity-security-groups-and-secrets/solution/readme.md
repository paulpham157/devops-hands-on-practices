# Identity, Security Groups, and Secrets

1. Templates are often versioned and reviewed broadly, so embedding admin secrets would leak high-value credentials.
2. Roles scoped through Keystone project membership limit allowed actions.
3. Broad inbound rules create accidental permanent exposure and normalize unsafe defaults.
