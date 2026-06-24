# Solution: Instrument a Span

The whole checkout request is represented by:

```text
GET /checkout
```

Child spans:

- `inventory.lookup`
- `payment.authorize`

Slow or failed request attributes:

- `checkout.slow`
- `checkout.fail`
- `work.duration_ms`

The exception is recorded on `payment.authorize` and also on the parent `GET /checkout` span.

Useful extra attributes could include:

- `cart.item_count`
- `customer.tier`
- `payment.currency`
- `inventory.region`

Avoid recording sensitive fields such as card numbers, access tokens, passwords, or raw customer personal data.

