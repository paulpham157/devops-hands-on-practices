# Solution: Render an Argo CD Application

The `repoURL` should match the Git URL you passed through `REPO_URL`.

The default path is:

```text
12-argocd-gitops/gitops-repo/apps/course-web/overlays/dev
```

The app deploys into:

```text
docker-course-gitops
```

The enabled sync options are:

```text
CreateNamespace=true
PrunePropagationPolicy=foreground
ApplyOutOfSyncOnly=true
```
