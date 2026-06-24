# Explainer: Instrument a Span

A span is a timed unit of work.

The sample app creates spans for:

- `GET /`
- `GET /checkout`
- `inventory.lookup`
- `payment.authorize`

Useful span data:

| Data | Example |
| --- | --- |
| name | `payment.authorize` |
| attribute | `payment.provider=training-gateway` |
| event | `homepage rendered` |
| status | `OK` or `ERROR` |
| exception | recorded when payment fails |

Good spans should help answer where time was spent and where the failure happened.

