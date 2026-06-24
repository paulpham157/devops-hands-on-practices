# Solution: Map STS AssumeRole

The trusted role is:

```text
arn:aws:iam::111111111111:role/security-audit
```

The allowed STS action is:

```text
sts:AssumeRole
```

`sts:ExternalId` helps protect cross-account delegation, especially when a third party assumes roles across many customer accounts.

After assumption, allowed actions are defined by permission policies attached to the target role, plus any boundaries, session policies, SCPs, and resource policies.
