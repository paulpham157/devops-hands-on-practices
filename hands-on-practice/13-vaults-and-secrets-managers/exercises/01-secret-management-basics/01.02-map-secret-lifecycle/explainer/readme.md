# Explainer: Map the Secret Lifecycle

A secret lifecycle is more than storage.

Think in stages:

```text
create -> store -> grant access -> inject at runtime -> audit use -> rotate -> revoke -> delete
```

Weak secret management usually fails at one of these points:

- Secrets are created manually and never rotated.
- Too many users or workloads can read them.
- Values are copied into Git, images, tickets, or logs.
- No one knows who read the secret.
- Rotation is untested and breaks production.

Good systems make rotation and revocation normal operations.
