# Explainer: Map STS AssumeRole

STS issues temporary credentials.

For `AssumeRole`, the flow is:

```text
caller identity -> sts:AssumeRole -> trusted IAM role -> temporary access key, secret key, session token
```

Two policy checks matter:

1. The caller must be allowed to call `sts:AssumeRole` on the target role.
2. The target role trust policy must trust the caller.

After that, the role's permission policies determine what the temporary session can do.
