# Explainer: Message-Driven AsyncAPI

Message-driven systems decouple producers and consumers.

Instead of:

```text
service A calls service B now
```

you get:

```text
service A publishes event
service B consumes event later
```

AsyncAPI documents channels, messages, payloads, and operations for asynchronous APIs.

This is useful for queues, streams, and pub/sub systems.

