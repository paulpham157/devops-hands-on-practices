# Avoid Shared General-Purpose BFF

A BFF can decay into a second shared monolith if every client and every concern gets pulled into one backend.

Warning signs:

- many unrelated clients share one BFF
- product-specific logic mixes freely
- the BFF starts owning business rules
- every new feature depends on one central team

