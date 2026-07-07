# Exercises: Docker Compose with Flask and Redis

## Sections

1. `01-compose-basics`
   - Change the published web port and verify service reachability.
2. `02-configuration`
   - Add application configuration through Compose environment variables.
3. `03-state`
   - Persist Redis data with a named volume.
4. `04-failure-modes`
   - Observe and improve behavior when Redis is unavailable.
5. `05-inspection`
   - Read the fully rendered Compose model.

## Suggested Flow

Start with service wiring, then configuration, then state and failure behavior.

```text
ports -> environment -> volumes -> outage behavior -> rendered config
```

## Completion Target

By the end, you should be able to explain:

- How Compose publishes ports and connects services.
- How app configuration enters a container.
- Why Redis state disappears without a volume.
- How to verify behavior with `curl`, logs, and `docker compose config`.
