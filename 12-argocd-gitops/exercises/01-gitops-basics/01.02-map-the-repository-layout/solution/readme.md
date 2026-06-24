# Solution: Map the Repository Layout

The reusable base is:

```text
gitops-repo/apps/course-web/base
```

The dev overlay is:

```text
gitops-repo/apps/course-web/overlays/dev
```

The dev replica count is set in:

```text
gitops-repo/apps/course-web/overlays/dev/patch-deployment.yaml
```

The Argo CD Application template is:

```text
argocd/applications/course-web.yaml.tpl
```
