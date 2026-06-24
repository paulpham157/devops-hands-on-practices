# Solution: Understand Serverless Model

The platform usually manages servers, scaling, runtime startup, event routing, and deployment infrastructure.

The developer still owns code, dependencies, configuration, secrets, permissions, retries, idempotency, observability, and cost controls.

Functions should usually be stateless because local memory or disk may not survive between invocations.

Idempotency is important because event integrations can retry and deliver the same event more than once.

A long-running video conversion job is usually better handled by a queue plus container job or worker service, not a short request-response function.

