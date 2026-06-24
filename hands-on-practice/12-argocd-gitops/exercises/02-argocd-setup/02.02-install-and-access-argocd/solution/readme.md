# Solution: Install and Access Argo CD

Argo CD runs in:

```text
argocd
```

The UI is exposed through:

```text
svc/argocd-server
```

The first login username is:

```text
admin
```

Production should use SSO and RBAC because shared admin credentials make auditing, least privilege, and team-level access control weak.
