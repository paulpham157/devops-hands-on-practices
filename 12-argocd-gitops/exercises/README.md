# Exercises: Argo CD GitOps

## Sections

1. `01-gitops-basics`
   - Understand reconciliation.
   - Map the GitOps repository layout.

2. `02-argocd-setup`
   - Create a local K3s cluster with k3d.
   - Install and access Argo CD.

3. `03-applications-and-sync`
   - Render an Argo CD Application from a Git URL.
   - Sync the course web app from Git.

4. `04-drift-and-policy`
   - Create live drift and let Argo CD repair it.
   - Choose an appropriate sync policy.

## Completion Target

By the end, you should be able to explain:

- Why GitOps uses Git as the desired-state source of truth.
- Why Argo CD pulls desired state instead of CI pushing manifests directly.
- How a Kustomize overlay becomes an Argo CD Application source.
- What automated sync, prune, and self-heal do.
- Why production GitOps usually needs RBAC, SSO, secret management, and approval controls.
