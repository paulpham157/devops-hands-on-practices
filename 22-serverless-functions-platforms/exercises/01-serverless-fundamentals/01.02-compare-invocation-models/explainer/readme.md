# Explainer: Compare Invocation Models

Serverless functions can start from different triggers.

Common models:

- HTTP request
- queue message
- object storage event
- scheduled timer
- edge request
- background job

The trigger affects timeout, retries, payload shape, security, and observability.

Design the trigger before writing the handler.

