# Retries, Timeouts, and Overload Risks

Retries can improve resilience when failures are transient.

Retries can also make incidents worse when:

- timeouts are too long
- retry counts are too high
- all clients retry at once
- the dependency is already overloaded

Availability patterns must be coordinated, not configured in isolation.

