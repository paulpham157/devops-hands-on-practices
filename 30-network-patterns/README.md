# Lesson 30: Network Patterns

## Goal

Learn cloud application network patterns that shape traffic flow, security boundaries, and edge responsibilities.

This lesson teaches:

- why network patterns matter above raw infrastructure networking
- ingress, egress, and trust boundaries
- Ambassador for outbound access to external services
- Gateway Routing, Gateway Aggregation, and Gateway Offloading
- Gatekeeper for validating and filtering requests at the edge
- Valet Key for controlled direct access to protected resources
- Static Content Hosting for separating static delivery from application compute

No cloud account is required for the core exercises.

## Navigation

- Previous lesson: `29-design-and-implementation-patterns`
- Next lesson: `31-backend-for-frontend`

## Related Lessons

- `19-redis-caching-load-balancing`
- `26-service-mesh`
- `31-backend-for-frontend`

## Prerequisites and Entry Check

- Completion of `19-redis-caching-load-balancing` and `26-service-mesh`, or equivalent HTTP/network-boundary experience.
- No cloud account is required for the core pattern maps and scenarios.

Entry check: draw one request path with ingress, egress, trust boundary, and the component responsible for authorization.

## Mental Model

```text
client or service -> network boundary component -> route, validate, translate, offload, or grant access -> backend capability
```

These patterns are about where traffic responsibilities live:

- where requests enter
- how requests are split or combined
- where authentication or protocol concerns are handled
- when clients can bypass the app safely for direct content or storage access

## Core Problems

| Problem | Typical Question |
| --- | --- |
| Edge complexity | Which concerns belong at the gateway instead of in every service? |
| External dependency access | How should workloads safely reach remote services? |
| Request shaping | Should one request fan out to multiple backends or route to one? |
| Access delegation | Can clients get temporary direct access without full backend mediation? |
| Performance | Which content can be served from cheaper, simpler infrastructure? |

## Lab Layout

```text
pattern-maps/        Comparison tables and operational checklists
gateway-patterns/    Routing, aggregation, and offloading examples
ambassador/          Outbound helper and egress access examples
gatekeeper/          Edge validation examples
valet-key/           Temporary access token flow examples
static-content/      Static asset delivery examples
scenario-designs/    Client and backend network scenarios
scripts/             Validation helper
exercises/           Structured hands-on practice
```

## Core Patterns

| Pattern | What It Solves | Main Tradeoff |
| --- | --- | --- |
| Ambassador | standardize outbound access to external services | extra hop and helper ownership |
| Gateway Routing | route requests to the correct backend by path, host, or rule | gateway becomes critical routing boundary |
| Gateway Aggregation | combine multiple backend calls into one client response | added latency and partial failure logic at gateway |
| Gateway Offloading | move SSL, auth, caching, or compression out of app services | edge layer grows in responsibility |
| Gatekeeper | validate and filter traffic before it reaches protected services | duplicated rules if boundary ownership is weak |
| Valet Key | temporary direct access to protected resources | token issuance and revocation complexity |
| Static Content Hosting | serve static assets from simpler delivery path | split deployment and cache invalidation management |

## Gateway Notes

Gateway patterns should be chosen deliberately:

- Routing when the main job is directing traffic
- Aggregation when the client would otherwise call many backends
- Offloading when shared transport or edge concerns should be centralized

Do not overload one gateway with every possible responsibility unless the team is ready to operate it as a real platform boundary.

## Ambassador Notes

The Ambassador pattern is usually about outbound connectivity, not ingress.

It helps when:

- many services must call the same external system
- access policy, retries, auth, or protocol details should be centralized
- application teams should consume a simpler local contract

## Gatekeeper Notes

Gatekeeper sits in front of protected services and decides whether requests should pass.

Typical responsibilities:

- authentication precheck
- schema or header validation
- protocol compliance
- deny rules for obviously invalid traffic

This reduces waste on backend systems and protects sensitive services.

## Valet Key and Static Content Notes

Valet Key lets a backend issue a limited token so the client can access storage or another protected resource directly.

Static Content Hosting keeps static assets on a simpler path, often improving latency and reducing load on application services.

These patterns are useful when the backend does not need to stream every byte itself.

## Production Questions

Before choosing a network pattern, answer:

1. Is the main problem ingress routing, outbound dependency access, or direct resource access?
2. Which security checks must happen before backend code runs?
3. Which clients suffer from too many backend round trips?
4. Which workloads are static enough to separate from application compute?
5. Who owns the edge policy, token issuance, and routing rules?

## Validate

From this lesson directory:

```bash
./scripts/validate.sh
```

This checks:

- required lesson files
- shell script syntax
- YAML syntax
- JSON syntax

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover pattern purpose, ingress and egress boundaries, gateway responsibilities, gatekeeping, ambassador usage, valet key flow, static delivery, and pattern selection.

## Cleanup

The core exercises use manifests and design files. Remove only generated reports or resources applied to a disposable local environment; verify the target before deleting anything.

## References

- Azure Architecture Center patterns: https://learn.microsoft.com/azure/architecture/patterns/
- Azure Ambassador pattern: https://learn.microsoft.com/azure/architecture/patterns/ambassador
- Azure Gateway Routing pattern: https://learn.microsoft.com/azure/architecture/patterns/gateway-routing
- Azure Gateway Aggregation pattern: https://learn.microsoft.com/azure/architecture/patterns/gateway-aggregation
- Azure Gateway Offloading pattern: https://learn.microsoft.com/azure/architecture/patterns/gateway-offloading
- Azure Gatekeeper pattern: https://learn.microsoft.com/azure/architecture/patterns/gatekeeper
- Azure Static Content Hosting pattern: https://learn.microsoft.com/azure/architecture/patterns/static-content-hosting
- Azure Valet Key pattern: https://learn.microsoft.com/azure/architecture/patterns/valet-key
- Azure Backends for Frontends pattern: https://learn.microsoft.com/azure/architecture/patterns/backends-for-frontends
