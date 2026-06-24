# Explainer: Sync the Course Web App

When you apply the Argo CD Application, Argo CD reads the configured Git repo and path.

```bash
REPO_URL=https://github.com/YOUR_ORG/docker-course.git ./scripts/apply-application.sh
```

The Application uses automated sync:

```text
prune: true
selfHeal: true
```

That means Argo CD creates missing resources, deletes resources removed from Git, and repairs manual drift.
