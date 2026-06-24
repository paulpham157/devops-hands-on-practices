# Sidecar Responsibilities

A sidecar is usually appropriate for behavior that is:

- repeated across many services
- operational rather than domain-specific
- easier to standardize outside the app binary

Examples:

- log shipping
- proxying
- secret refresh
- protocol mediation

Avoid pushing core business logic into sidecars. That only hides complexity instead of isolating it.

