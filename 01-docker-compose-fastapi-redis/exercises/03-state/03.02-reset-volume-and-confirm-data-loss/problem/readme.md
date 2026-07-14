# Reset Volume and Confirm Data Loss

## Task

First verify that Redis data survives a normal restart. Then remove the volume and confirm the counter resets.

Useful commands:

```bash
docker compose down
docker compose up -d
docker compose down --volumes
docker compose up -d
```

## Done When

You can explain which command preserves Redis data and which command removes it.
