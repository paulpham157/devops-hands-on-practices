# Platform Engineering Exercise

This exercise defines a golden path for deploying the reference order-flow system. A golden path is a supported default with clear escape hatches; it is not permission to hide platform complexity or force every team into one architecture.

## Proposed Golden Path

1. Start from the reference-system service contract.
2. Declare owner, SLO reference, budget, runtime security, and network policy.
3. Run local validation and policy checks.
4. Produce an immutable artifact and reviewed deployment change.
5. Publish metrics/logs/traces and a runbook link.
6. Promote through an environment with an explicit rollback boundary.

The path should expose the reference system's known gaps—simulated identity, simplified queue semantics, optional telemetry—and require teams to choose an approved production implementation before launch.

## Platform Product Metrics

Use [platform-metrics-template.md](platform-metrics-template.md) to define adoption, time-to-first-valid-deployment, change failure rate, recovery time, support load, and escape-hatch frequency. Measure developer outcomes, not only platform component uptime.

## Ownership and Escape Hatches

- Platform team owns the paved workflow, policy version, templates, and support contract.
- Application team owns business behavior, service SLO decisions, and runbook content.
- Security/reliability reviewers own exceptions and expiry signals.
- Teams may leave the golden path with a documented ADR, risk owner, and migration/rollback plan.
