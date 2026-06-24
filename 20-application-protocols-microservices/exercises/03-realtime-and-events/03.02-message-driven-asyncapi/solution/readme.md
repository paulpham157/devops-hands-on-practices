# Solution: Message-Driven AsyncAPI

The channel address is:

```text
catalog.product.changed
```

The message name is:

```text
ProductChanged
```

Required payload fields:

- `id`
- `name`
- `price`
- `occurredAt`

Consumers should be idempotent because messages may be retried or delivered more than once.

Async messaging is better when work can happen later, consumers should be decoupled, or the system needs buffering during traffic spikes.

