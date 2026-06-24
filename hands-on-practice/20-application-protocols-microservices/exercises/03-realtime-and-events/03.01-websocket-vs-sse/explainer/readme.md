# Explainer: WebSocket vs SSE

WebSocket is full duplex.

```text
client <-> server
```

Server-Sent Events is one-way from server to client.

```text
server -> client
```

Use WebSocket when both sides need to send messages anytime.

Use SSE when the server only needs to push updates to a browser or HTTP client.

