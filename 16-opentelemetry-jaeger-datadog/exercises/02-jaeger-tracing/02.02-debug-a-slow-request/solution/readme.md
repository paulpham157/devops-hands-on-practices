# Solution: Debug a Slow Request

The exact durations vary because the app uses random sleep values.

Expected pattern:

- total trace duration is higher for `slow=true`.
- `payment.authorize` usually takes longer than `inventory.lookup`.
- `work.duration_ms` shows simulated work duration.
- `checkout.slow=true` confirms the request was intentionally slow.

The first investigation target is usually:

```text
payment.authorize
```

That span dominates the slow request in this sample app.

