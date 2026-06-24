# Versioning, Security, and Observability

## Versioning

Avoid breaking clients.

Common approaches:

- URL versioning for REST, such as `/v1/products`
- compatible schema evolution for Protobuf
- field deprecation in GraphQL
- event version fields for messages

Do not remove fields until all consumers have migrated.

## Security

Common controls:

- TLS everywhere
- authentication tokens
- mTLS for internal services
- authorization at resource or field level
- input validation
- rate limits
- request size limits

Security must match the protocol. WebSocket and message consumers need authorization too.

## Observability

Track:

- request rate
- latency
- error rate
- saturation
- timeout count
- retry count
- message lag
- consumer failure count
- trace IDs across services

For microservices, propagate request IDs and trace context across protocol boundaries.

