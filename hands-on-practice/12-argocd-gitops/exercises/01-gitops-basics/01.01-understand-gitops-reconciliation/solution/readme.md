# Solution: Identify the Source of Truth

The desired Kubernetes state is stored under:

```text
gitops-repo/apps/course-web/overlays/dev
```

Argo CD compares the Git desired state with the live cluster.

Self-heal repairs live changes that do not match Git, such as someone manually scaling a Deployment away from the Git-declared replica count.

Direct `kubectl apply` is not the main deployment mechanism because the lesson is modeling GitOps: commit desired state to Git and let Argo CD pull and reconcile it.
