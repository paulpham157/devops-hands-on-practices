# Exercises: Network Patterns

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-network-pattern-foundations/01.01-why-network-patterns`
   - Understand what these patterns isolate beyond raw networking.

2. `01-network-pattern-foundations/01.02-ingress-egress-and-boundaries`
   - Separate ingress, egress, and direct access responsibilities.

3. `02-gateway-patterns/02.01-gateway-routing-aggregation-offloading`
   - Compare major gateway responsibilities.

4. `02-gateway-patterns/02.02-gatekeeper-and-edge-validation`
   - Apply validation and filtering before backend admission.

5. `03-access-and-delivery-patterns/03.01-ambassador-and-external-service-access`
   - Read the Ambassador pattern for outbound access.

6. `03-access-and-delivery-patterns/03.02-valet-key-and-static-content-hosting`
   - Use direct scoped access and split static delivery safely.

7. `04-production-network-architecture/04.01-latency-security-and-failure-modes`
   - Reason about latency, security, and boundary failures.

8. `04-production-network-architecture/04.02-choose-the-right-network-pattern`
   - Choose the right pattern for realistic client and backend traffic problems.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
```

Then inspect:

```text
pattern-maps/
gateway-patterns/
ambassador/
gatekeeper/
valet-key/
static-content/
scenario-designs/
```

No cloud account is required.

