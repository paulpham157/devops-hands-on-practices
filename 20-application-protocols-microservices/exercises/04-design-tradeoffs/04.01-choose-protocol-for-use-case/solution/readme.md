# Solution: Choose Protocol for Use Case

1. Public catalog API: REST, because broad HTTP compatibility matters.
2. Internal payment call: gRPC, because typed internal RPC and deadlines are useful.
3. Frontend selected fields: GraphQL, because clients can request the data shape they need.
4. Collaborative editor: WebSocket, because bidirectional realtime communication is needed.
5. Email after registration: message-driven event, because sending email can happen asynchronously.
6. Export progress updates: SSE, because server-to-client progress events are enough.

