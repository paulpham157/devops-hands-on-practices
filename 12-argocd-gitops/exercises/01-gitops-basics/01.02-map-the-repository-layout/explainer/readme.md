# Explainer: Map the Repository Layout

This lesson separates app desired state from Argo CD configuration.

```text
gitops-repo/apps/course-web/base
gitops-repo/apps/course-web/overlays/dev
argocd/applications/course-web.yaml.tpl
```

The base contains reusable Kubernetes resources.

The dev overlay changes environment-specific settings, such as replica count and labels.

The Argo CD Application tells Argo CD which Git repo, branch, and path to sync.

This mirrors a real GitOps repo where teams keep app manifests and Argo CD app definitions versioned.
