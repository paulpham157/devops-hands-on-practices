# Operations Checklist

Use this checklist before applying these patterns.

## Boundary Clarity

- What concern is being isolated?
- Is the pattern protecting the domain or just hiding a weak design?
- Who owns the boundary over time?

## Runtime Risk

- What happens if the sidecar, router, or adapter fails?
- Can the main service continue in degraded mode?
- Is monitoring attached to both the app and the helper boundary?

## Migration Safety

- For Strangler Fig, how is traffic cut over and rolled back?
- Which capabilities still depend on the legacy system?
- Is dual-write or state synchronization involved?

## Integration Quality

- For ACL, are translations explicit and testable?
- Are external enums, statuses, and IDs prevented from leaking inward?
- Is protocol mismatch handled at the boundary instead of in domain services?

