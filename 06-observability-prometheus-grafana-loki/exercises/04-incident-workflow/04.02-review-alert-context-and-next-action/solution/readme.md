# Review Alert Context and Next Action

Reasonable first steps:

- open the error-rate metric and confirm time window and service
- compare latency and traffic volume to rule out pure load change
- query Loki for `status >= 500` on the same service and period
- inspect whether failures cluster around one route or dependency

The next action should be specific, for example pausing a rollout or checking the failing downstream call path.
