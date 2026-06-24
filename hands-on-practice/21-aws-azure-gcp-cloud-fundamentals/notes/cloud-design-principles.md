# Cloud Design Principles

## Start with Boundaries

Define:

- organization ownership
- account/subscription/project structure
- environment separation
- region strategy
- network boundaries
- identity model

These decisions are expensive to fix later.

## Prefer Managed Services When Appropriate

Managed services reduce operational work, but they increase provider coupling.

Choose managed services when:

- the team lacks operational capacity.
- the service is not a differentiator.
- reliability and patching matter.
- integration with cloud IAM and observability helps.

Choose self-managed services when:

- portability matters more.
- custom configuration is required.
- licensing or compliance requires it.

## Design for Failure

Cloud infrastructure fails in smaller units:

- process
- node
- zone
- region
- dependency
- identity provider
- network path

Use multi-zone designs before multi-region designs unless the workload truly needs regional disaster recovery.

## Control Cost Early

Minimum controls:

- tags or labels
- budgets
- alerts
- right-sizing
- storage lifecycle policies
- idle resource cleanup
- log retention

Cost is an architecture concern, not only a finance concern.

