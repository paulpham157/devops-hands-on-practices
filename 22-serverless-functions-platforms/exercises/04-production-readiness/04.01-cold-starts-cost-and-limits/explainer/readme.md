# Explainer: Cold Starts, Cost, and Limits

Serverless platforms have limits.

Common constraints:

- timeout
- memory
- request size
- response size
- concurrency
- package size
- runtime support

Cold starts add latency when a new function instance initializes.

Cost can rise through high duration, high memory, high invocation count, heavy logging, or downstream service usage.

