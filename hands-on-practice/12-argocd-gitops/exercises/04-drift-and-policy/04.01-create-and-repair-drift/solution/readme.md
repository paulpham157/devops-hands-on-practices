# Solution: Create and Repair Drift

The manual drift is:

```bash
kubectl scale deployment/course-web -n docker-course-gitops --replicas=1
```

The desired replica count is declared in:

```text
gitops-repo/apps/course-web/overlays/dev/patch-deployment.yaml
```

Argo CD should restore:

```text
replicas: 2
```

This is useful because it makes unmanaged manual cluster changes visible and reversible.
