# Capstone System Brief: Order Flow

You inherit the local reference order-flow system. It currently has a gateway, Flask API, Redis-backed cache and queue, one worker, and optional Prometheus. Its queue uses a local processing-list acknowledgement pattern, but has no idempotency, retry limit, or poison-message policy; the gateway's `X-Role` header is a simulated boundary rather than authentication.

## Business Context

- The system accepts orders for a regional retail product.
- Peak traffic is 250 requests/second for two hours during a campaign; normal traffic is 20 requests/second.
- An accepted order must not be silently lost.
- The platform team has two engineers this quarter. The application team can spend one sprint on migration work.
- The first production deployment has a monthly infrastructure budget target of USD 1,500. State assumptions rather than inventing prices.

## Required Constraints

- Use the declared availability objective as a starting point, then defend changes you make.
- Replace the simulated identity boundary with a design that has explicit trust boundaries and secret handling.
- Support a tested backup, restore, and disaster-recovery plan with explicit RPO and RTO.
- Provide a safe delivery and migration strategy from the current processing-list model to an idempotent, retryable production design.
- Keep local-first learning possible. Cloud choices may be design-only, but their operational consequences must be concrete.
- Preserve a human-operable fallback when automation or a dependency is degraded.

## Injected Event

During the campaign, Redis becomes intermittently unavailable and order latency rises. A security review also finds that a client can set any `X-Role` header. You must decide what to mitigate first, what to communicate, and how to prevent recurrence without freezing delivery indefinitely.

## Non-Goals

- Do not select a provider only because a lesson names it.
- Do not assume unlimited budget, staff, or a greenfield rewrite.
- Do not claim exact throughput, cost, recovery, or compliance results without showing assumptions and validation plans.
