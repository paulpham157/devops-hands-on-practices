# Explainer: Create and Repair Drift

Drift means the live cluster does not match Git.

This lesson creates drift by manually scaling the Deployment:

```bash
./scripts/simulate-drift.sh
```

The dev overlay declares:

```text
replicas: 2
```

The script changes the live cluster to:

```text
replicas: 1
```

Because self-heal is enabled, Argo CD should reconcile the Deployment back to `2`.
