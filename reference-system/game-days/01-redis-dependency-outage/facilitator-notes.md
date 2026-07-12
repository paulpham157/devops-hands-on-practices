# Facilitator Notes: Redis Dependency Outage

This file is intentionally separated from the learner brief. Do not surface it before an attempted investigation.

The fault stops the local Redis container. The gateway may remain reachable, while API requests that use Redis fail. A good learner response distinguishes process availability from the user journey, restores Redis, verifies the end-to-end check, and avoids asserting that the local SLO policy measures a real 30-day error budget.

Useful follow-up ideas include dependency-aware readiness, degraded behavior for non-critical counter reads, alert design, durable queue semantics, backup/restore drills, and explicit incident communication. Do not require any one mitigation as the sole correct answer.
