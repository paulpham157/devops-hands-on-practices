# Choose When to Use BFF

The right decision depends on client divergence.

Strong signals for BFF:

- web and mobile need different shapes
- one client needs aggregation the others do not
- client team ownership is clear

Strong signals against BFF:

- current APIs already fit all clients
- the proposed logic is generic gateway behavior
- the team is about to create one more shared backend without a clear client boundary

