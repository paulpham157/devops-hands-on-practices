# Partial Failure and Graceful Degradation

A distributed system is usually healthiest when it can keep core behavior alive while non-critical features are reduced.

Graceful degradation means deciding in advance:

- what can be disabled
- what can become stale
- what must remain correct

