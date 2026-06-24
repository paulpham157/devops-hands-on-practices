# Solution: Understand SCP Guardrails

The SCP denies:

```text
organizations:LeaveOrganization
```

An SCP does not grant `s3:GetObject`. It only limits the maximum available permissions.

Explicit deny wins because AWS policy evaluation stops allowed access when any applicable deny matches.

SCPs should be managed in AWS Organizations at the root, organizational unit, or account level.
