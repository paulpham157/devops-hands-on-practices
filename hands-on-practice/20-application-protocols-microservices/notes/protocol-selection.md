# Protocol Selection Notes

Choose protocol style by constraints, not popularity.

## REST

Good default for public APIs and simple request-response services.

Strengths:

- easy to debug with curl and browser tools
- widely supported
- works well with HTTP infrastructure
- OpenAPI contracts are common

Watch out for:

- inconsistent conventions
- weak type safety
- over-fetching or under-fetching
- versioning drift

## gRPC

Good for internal service-to-service communication where strict contracts and performance matter.

Strengths:

- Protobuf contracts
- code generation
- HTTP/2 transport
- unary and streaming RPCs

Watch out for:

- browser and proxy compatibility
- harder manual debugging than REST
- schema evolution discipline

## GraphQL

Good when clients need flexible field selection and one API composes many data sources.

Strengths:

- client chooses fields
- typed schema
- strong frontend fit

Watch out for:

- query cost control
- authorization per field
- caching complexity

## WebSocket

Good for bidirectional realtime communication.

Examples:

- collaborative editing
- multiplayer games
- chat
- realtime dashboards with client actions

Watch out for:

- long-lived connection scaling
- backpressure
- reconnect behavior
- sticky-session pressure

## Server-Sent Events

Good for server-to-client updates over HTTP.

Examples:

- notifications
- status updates
- logs streaming
- progress events

Watch out for:

- one-way only
- connection limits
- retry behavior

## Message-Driven APIs

Good for asynchronous workflows and decoupled systems.

Examples:

- order created
- payment authorized
- user registered
- image processing requested

Watch out for:

- idempotency
- ordering
- duplicate delivery
- poison messages
- consumer lag

