# Explainer: Compare Protocol Styles

Application protocols differ in communication shape.

REST is request-response over HTTP, commonly using JSON.

gRPC is RPC over HTTP/2, commonly using Protobuf.

GraphQL lets clients ask for exactly the fields they need from a typed schema.

WebSocket keeps a bidirectional connection open.

Server-Sent Events keeps a one-way server-to-client event stream open.

Message-driven APIs decouple producers and consumers through queues or streams.

