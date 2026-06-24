# Caching, Error Normalization, and Observability

BFF often becomes the place where client-visible failure is shaped.

Useful concerns:

- cache safe read-heavy aggregates
- turn inconsistent downstream errors into stable client contracts
- trace fan-out latency to downstream services

This makes BFF operationally important even though it is not the source of truth.

