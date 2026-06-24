# Explainer: Debug a Slow Request

Distributed tracing is useful because it shows where time was spent inside a request.

For a slow checkout request, compare:

- total trace duration
- `inventory.lookup` span duration
- `payment.authorize` span duration

If the parent span is slow but no child span is slow, the missing time may be uninstrumented work.

If one child span dominates the trace, start investigation there.

