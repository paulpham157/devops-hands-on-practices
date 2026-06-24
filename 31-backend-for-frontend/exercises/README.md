# Exercises: Backend for Frontend

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-bff-foundations/01.01-why-bff`
   - Understand when a client-specific backend layer is useful.

2. `01-bff-foundations/01.02-bff-vs-api-gateway`
   - Separate generic gateway concerns from client-specific backend concerns.

3. `02-client-specific-backends/02.01-web-vs-mobile-bff`
   - Compare web and mobile response shaping needs.

4. `02-client-specific-backends/02.02-aggregation-transformation-and-auth`
   - Apply aggregation, field shaping, auth, and error normalization at the BFF layer.

5. `03-team-and-boundary-design/03.01-bff-ownership-and-bounded-context`
   - Keep BFF ownership close to the client boundary.

6. `03-team-and-boundary-design/03.02-avoid-shared-general-purpose-bff`
   - Avoid turning BFF into a second shared monolith.

7. `04-production-bff-operations/04.01-caching-error-normalization-and-observability`
   - Operate BFF safely with caching, normalized errors, and dependency-aware monitoring.

8. `04-production-bff-operations/04.02-choose-when-to-use-bff`
   - Choose when BFF is justified and when gateway-only is enough.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
```

Then inspect:

```text
pattern-maps/
bff-web/
bff-mobile/
bff-shared-services/
scenario-designs/
```

No cloud account is required.

