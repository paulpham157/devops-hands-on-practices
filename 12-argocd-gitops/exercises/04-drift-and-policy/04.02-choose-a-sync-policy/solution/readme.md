# Solution: Choose a Sync Policy

A reasonable dev policy:

```text
automated sync: yes
prune: yes
selfHeal: yes
```

A cautious production policy:

```text
automated sync: maybe
prune: only with review
selfHeal: yes for low-risk workloads, cautious for high-risk changes
```

Production should add:

- SSO and RBAC
- protected Git branches
- pull request review
- secret management
- sync windows
- alerting on degraded or out-of-sync apps
- rollback procedure

The point is not that automation is unsafe. The point is that production automation needs explicit policy.
