# Solution: Security, Observability, and Deployments

Monitor invocation count, errors, duration, cold starts if available, throttles, retries, dead-letter queue count, downstream latency, and cost.

Structured logs should include request ID, function name, event type, status, and error details when safe.

IAM changes should be reviewed because overly broad permissions can turn one function bug into a larger security incident.

Separate environments reduce blast radius and let teams test before production.

Rollback procedure should define how to return code, config, runtime, and permissions to a known good version.

