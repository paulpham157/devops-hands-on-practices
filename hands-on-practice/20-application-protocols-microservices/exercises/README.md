# Exercises: Application Protocols for Microservices

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-foundations/01.01-compare-protocol-styles`
   - Compare REST, gRPC, GraphQL, WebSocket, SSE, and message-driven APIs.

2. `01-foundations/01.02-contracts-and-schemas`
   - Read OpenAPI, Protobuf, GraphQL schema, and AsyncAPI contracts.

3. `02-rest-and-grpc/02.01-run-rest-api`
   - Run and inspect the REST API.

4. `02-rest-and-grpc/02.02-run-grpc-service`
   - Run and inspect the gRPC service.

5. `03-realtime-and-events/03.01-websocket-vs-sse`
   - Choose between bidirectional WebSocket and one-way SSE.

6. `03-realtime-and-events/03.02-message-driven-asyncapi`
   - Design an asynchronous event contract.

7. `04-design-tradeoffs/04.01-choose-protocol-for-use-case`
   - Pick a protocol for realistic microservice scenarios.

8. `04-design-tradeoffs/04.02-versioning-security-observability`
   - Apply production concerns to protocol design.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
docker compose up --build
./scripts/call-rest.sh
./scripts/call-grpc.sh
docker compose down
```

The REST and gRPC examples implement the same product lookup use case so the protocol differences are easier to see.

