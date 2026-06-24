# Choose a Service Mesh

1. Istio. Tradeoff: higher operational and conceptual complexity.
2. Linkerd. Tradeoff: smaller traffic and policy feature surface than Istio.
3. Consul. Tradeoff: operating model is tied more closely to the broader Consul ecosystem.
4. No mesh yet. Tradeoff: fewer platform controls now, but lower operational overhead until the real need appears.

The wrong mesh is often adding one before the platform has earned the complexity.

