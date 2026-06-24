# Explainer: Choose a Sync Policy

Argo CD sync policy is a control decision.

For a dev environment, this can be reasonable:

```text
automated sync
prune enabled
self-heal enabled
```

For production, the same settings may be too aggressive without approval gates, sync windows, monitoring, and rollback plans.

Important knobs:

- `prune`: delete resources removed from Git
- `selfHeal`: repair live drift
- `allowEmpty`: allow an app path to sync to zero resources
- sync windows: restrict when sync can happen
- retry: recover from temporary sync failures
