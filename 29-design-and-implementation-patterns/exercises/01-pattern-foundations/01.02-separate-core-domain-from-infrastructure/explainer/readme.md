# Separate Core Domain from Infrastructure

Core domain logic should not absorb every external concern.

Examples of non-domain concerns:

- legacy field names
- transport protocol quirks
- log forwarding
- proxying
- secret refresh

Good boundaries keep these concerns near adapters or helpers instead of inside domain services.

