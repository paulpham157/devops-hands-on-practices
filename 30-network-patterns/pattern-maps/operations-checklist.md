# Operations Checklist

Use this checklist before applying network patterns.

## Boundary

- Is the main concern ingress, egress, or direct resource access?
- Which responsibilities belong at the boundary and which stay in services?
- Who owns routing and policy updates?

## Security

- Which checks happen before backend traffic is admitted?
- Are direct access tokens scoped and time-limited?
- Is outbound access to external services standardized?

## Performance

- Will aggregation reduce client chattiness enough to justify added edge logic?
- Can static assets move off application compute?
- Does the gateway become a latency bottleneck?

## Failure Modes

- What happens if the gateway helper or ambassador fails?
- How are partial fan-out failures returned to clients?
- Can clients recover safely when valet-key access expires?

