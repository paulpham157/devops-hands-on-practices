# Explainer: Choose Protocol for Use Case

Choose protocol by constraints:

- human debugging
- browser support
- latency
- type safety
- streaming needs
- client flexibility
- asynchronous delivery
- infrastructure compatibility
- operational skill

Most systems use more than one protocol.

Example:

```text
public REST API -> internal gRPC -> async event stream -> WebSocket notifications
```

