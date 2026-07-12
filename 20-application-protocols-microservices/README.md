# Lesson 20: Application Protocols for Microservices

## Goal

Learn the main protocol styles applications and microservices use to communicate.

This lesson covers:

- HTTP REST APIs
- gRPC with Protocol Buffers
- GraphQL
- WebSocket
- Server-Sent Events
- Message-driven APIs with queues and event streams
- API contracts and schemas
- versioning, security, observability, and operational tradeoffs

The typo `rGPC` is usually written as `gRPC`.

## Navigation

- Previous lesson: `19-redis-caching-load-balancing`
- Next lesson: `21-aws-azure-gcp-cloud-fundamentals`

## Related Lessons

- `19-redis-caching-load-balancing`
- `27-data-management`
- `31-backend-for-frontend`

## Mental Model

```text
client -> protocol -> contract -> service -> response or event
```

A protocol is not just syntax. It affects latency, compatibility, debugging, load balancing, retries, security, and observability.

## Protocol Comparison

| Style | Best For | Data Shape | Communication | Watch Out For |
| --- | --- | --- | --- | --- |
| REST over HTTP | Public APIs, simple CRUD, broad compatibility | JSON | request/response | over-fetching, weak contracts if undocumented |
| gRPC | service-to-service, low-latency internal APIs | Protobuf | unary or streaming RPC | browser support, HTTP/2 infrastructure, schema discipline |
| GraphQL | client-driven data selection, frontend aggregation | JSON | query/mutation/subscription | query cost, caching, authorization complexity |
| WebSocket | bidirectional realtime apps | app-defined messages | long-lived full duplex | connection scaling, backpressure, sticky sessions |
| Server-Sent Events | server-to-client notifications | text event stream | long-lived one-way stream | client-to-server path still needs HTTP |
| Message queue/event stream | async workflows, decoupling, buffering | event messages | producer/consumer | ordering, retries, idempotency, poison messages |

## Lab Layout

```text
rest-api/          Flask REST API with OpenAPI contract
grpc-service/      gRPC service with protobuf contract
protocol-specs/    GraphQL and AsyncAPI examples
notes/             design notes and protocol selection guide
scripts/           run, call, and validation helpers
exercises/         structured hands-on practice
```

## Components

| Service | URL / Port | Purpose |
| --- | ---: | --- |
| REST API | http://localhost:5200 | JSON/HTTP request-response |
| gRPC service | localhost:5201 | Protobuf RPC over HTTP/2 |

Both services expose a small product catalog use case.

## Prerequisites and Entry Check

- Completion of `01-docker-compose-flask-redis` and `17-language-runtime-containerization`, or equivalent HTTP/container experience.
- Docker Engine with `docker compose` for the local protocol examples.

Entry check: explain the difference between a synchronous request/response call and an asynchronous event, including one failure mode for each.

## Run

Start both services:

```bash
cd 20-application-protocols-microservices
docker compose up --build
```

In another terminal, call REST:

```bash
./scripts/call-rest.sh
```

Call gRPC:

```bash
./scripts/call-grpc.sh
```

Stop:

```bash
docker compose down
```

## REST Practice

REST endpoint:

```bash
curl -fsS http://localhost:5200/products/42
```

Response shape:

```json
{
  "id": "42",
  "name": "training-product-42",
  "price": 29.0,
  "protocol": "rest"
}
```

Contract:

```text
rest-api/openapi.yaml
```

## gRPC Practice

gRPC contract:

```text
grpc-service/proto/catalog.proto
```

The service exposes:

```text
GetProduct(ProductRequest) returns (ProductReply)
Health(HealthRequest) returns (HealthReply)
```

The Docker image generates Python gRPC code at build time from the `.proto` file.

## Contract Files

| File | Purpose |
| --- | --- |
| `rest-api/openapi.yaml` | REST API contract |
| `grpc-service/proto/catalog.proto` | gRPC/Protobuf contract |
| `protocol-specs/schema.graphql` | GraphQL schema example |
| `protocol-specs/asyncapi.yaml` | Message-driven API contract example |

Contracts let teams discuss behavior before implementation and catch breaking changes earlier.

## Design Notes

Use REST when:

- broad HTTP compatibility matters.
- humans need to debug with curl easily.
- public API consumers are diverse.

Use gRPC when:

- services are internal.
- latency and strict contracts matter.
- streaming or typed code generation is useful.

Use GraphQL when:

- clients need flexible field selection.
- one API composes data from many services.

Use WebSocket when:

- client and server both need to send messages anytime.

Use Server-Sent Events when:

- server pushes updates to browser clients and clients do not need full duplex.

Use message queues or event streams when:

- producers and consumers should be decoupled.
- work can happen asynchronously.
- buffering and retries matter.

## Production Notes

For production microservices:

- define contracts in OpenAPI, Protobuf, GraphQL schema, or AsyncAPI.
- version APIs intentionally.
- make retries safe with idempotency keys or idempotent handlers.
- set timeouts and deadlines.
- propagate request IDs and trace context.
- document authentication and authorization.
- monitor latency, error rate, saturation, and message lag.
- avoid breaking schema changes.
- test backward and forward compatibility.
- choose protocols based on operational fit, not fashion.

## Validate

```bash
./scripts/validate.sh
```

This checks:

- shell script syntax
- Python syntax
- YAML syntax
- proto/spec file presence
- Docker Compose config when Docker is available

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover protocol comparison, contracts, REST, gRPC, WebSocket, SSE, AsyncAPI, protocol selection, versioning, security, and observability.

The AsyncAPI example uses specification version `3.1.0`, which is the current minor release in the AsyncAPI 3 line.

## Cleanup

```bash
docker compose down --remove-orphans
```

Remove generated local client/build output only if the lesson commands created it; do not delete contract source files.

## References

- OpenAPI Specification: https://spec.openapis.org/oas/latest.html
- gRPC documentation: https://grpc.io/docs/
- Protocol Buffers documentation: https://protobuf.dev/overview/
- GraphQL documentation: https://graphql.org/learn/
- MDN WebSocket API: https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API
- MDN Server-Sent Events: https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events
- AsyncAPI documentation: https://www.asyncapi.com/docs
