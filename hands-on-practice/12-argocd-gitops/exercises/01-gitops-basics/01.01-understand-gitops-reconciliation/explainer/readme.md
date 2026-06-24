# Explainer: Understand GitOps Reconciliation

GitOps changes the deployment loop.

Without GitOps, a person or CI job often pushes manifests directly:

```text
kubectl apply -> cluster changes
```

With Argo CD, Git stores the desired state:

```text
commit to Git -> Argo CD reads Git -> Argo CD compares live cluster -> Argo CD syncs drift
```

That compare-and-repair loop is reconciliation.

The key distinction is that Git is the source of truth. The cluster is expected to match Git, and Argo CD reports when it does not.
