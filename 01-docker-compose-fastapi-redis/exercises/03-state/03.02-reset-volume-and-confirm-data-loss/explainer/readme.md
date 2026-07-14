# Reset Volume and Confirm Data Loss

Named volumes keep state across `docker compose down` and `up`.

That persistence is useful for databases and caches, but it also means old state can hide whether a change really worked from a clean start.

You should know how to remove a volume intentionally when testing bootstrap behavior.
