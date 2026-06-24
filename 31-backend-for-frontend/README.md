# Lesson 31: Backend for Frontend

## Goal

Learn the Backend for Frontend pattern and when client-specific backend layers improve maintainability, performance, and team autonomy.

This lesson teaches:

- what Backend for Frontend (BFF) is
- why web, mobile, and partner clients often need different backend shapes
- how BFF differs from a generic API gateway
- aggregation, transformation, and client-optimized responses
- authentication, caching, error normalization, and observability at the BFF layer
- ownership boundaries and the risk of turning BFF into a shared monolith

No cloud account is required for the core exercises.

## Mental Model

```text
client -> client-specific BFF -> domain services and shared platform APIs
```

BFF exists because different clients often need:

- different payload shapes
- different latency tradeoffs
- different authentication or session handling
- different release cadence and ownership

## Core Problems

| Problem | Typical Question |
| --- | --- |
| Client mismatch | Why is one generic backend response awkward for every client? |
| Chattiness | Why does the client need too many backend calls to render one screen? |
| Ownership | Which team should own client-specific orchestration and formatting? |
| Edge complexity | Which logic belongs in BFF versus API gateway versus domain services? |

## Lab Layout

```text
pattern-maps/         Comparison tables and operational checklists
bff-web/              Web-focused BFF response shaping examples
bff-mobile/           Mobile-focused BFF response shaping examples
bff-shared-services/  Shared service dependencies and aggregation examples
scenario-designs/     Client and team ownership scenarios
scripts/              Validation helper
exercises/            Structured hands-on practice
```

## What BFF Solves

| Concern | How BFF Helps | Main Tradeoff |
| --- | --- | --- |
| client-specific payloads | tailor responses for web, mobile, or partner use | more backend surfaces to own |
| reduced client chattiness | aggregate several service calls into one client response | more orchestration logic in BFF |
| client release independence | separate backend changes by client | risk of duplicated logic |
| edge-specific policy | apply auth, caching, and error shaping per client | BFF can grow into a mini-monolith |

## BFF vs API Gateway

An API gateway usually handles generic edge concerns:

- routing
- TLS termination
- rate limiting
- generic auth enforcement

A BFF usually handles client-specific concerns:

- composing client-specific responses
- reshaping or trimming fields
- adapting auth/session flows per client
- packaging data for one client experience

Do not confuse them. A gateway is often shared infrastructure. A BFF is usually owned closer to a product or client team.

## Web and Mobile Differences

Web and mobile clients often differ in:

- payload size tolerance
- network reliability
- rendering needs
- release cadence
- authentication flow

That is why one BFF for web and one for mobile is often more maintainable than one universal client API.

## Ownership Notes

BFF is strongest when ownership is clear:

- web team owns web BFF
- mobile team owns mobile BFF
- domain teams still own business rules and source-of-truth services

BFF should not absorb core domain logic. It should orchestrate and present data for a client.

## Production Questions

Before creating a BFF, answer:

1. Which client problems are not solved well by the current API shape?
2. Is the main issue generic routing or client-specific orchestration?
3. Which team will own BFF code, releases, and observability?
4. Which logic must remain in domain services instead of moving into BFF?
5. Will this BFF stay client-specific or drift into a shared backend?

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

The exercises cover BFF motivation, BFF versus gateway, client-specific response shaping, ownership boundaries, caching and observability, and deciding when BFF is justified.

## References

- Azure Backends for Frontends pattern: https://learn.microsoft.com/azure/architecture/patterns/backends-for-frontends
- Sam Newman on BFF: https://samnewman.io/patterns/architectural/bff/
- Microsoft architecture patterns index: https://learn.microsoft.com/azure/architecture/patterns/

