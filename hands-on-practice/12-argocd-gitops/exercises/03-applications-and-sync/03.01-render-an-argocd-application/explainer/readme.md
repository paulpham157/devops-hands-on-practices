# Explainer: Render an Argo CD Application

An Argo CD `Application` connects Git to a cluster destination.

The important fields are:

- `spec.source.repoURL`
- `spec.source.targetRevision`
- `spec.source.path`
- `spec.destination.server`
- `spec.destination.namespace`
- `spec.syncPolicy`

This lesson uses a template because your Git URL is different from everyone else's.

Render it with:

```bash
REPO_URL=https://github.com/YOUR_ORG/docker-course.git ./scripts/render-application.sh
```
