# Explainer: Distroless Tradeoffs

Distroless images contain only the application runtime and required files. They usually do not include a shell, package manager, or common debugging tools.

Benefits:

- Smaller runtime surface
- Fewer unnecessary packages
- Less room for interactive drift

Costs:

- Harder to debug with `docker exec`
- Requires better logs and health checks
- Often needs a separate debug image or external observability

Distroless is a runtime pattern, not a replacement for dependency scanning or secure build practices.
