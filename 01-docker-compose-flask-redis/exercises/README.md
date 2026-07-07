# Docker Compose Exercises

These exercises extend lesson 01. Start the stack first:

```bash
cd 01-docker-compose-flask-redis
docker compose up --build
```

## Exercise Order

1. Change the published web port from `5001` to `8081`, then verify the app still reaches Redis.
2. Add an `APP_MESSAGE` environment variable in `compose.yaml`, read it in Flask, and render it on the page.
3. Add a named Redis volume so `page_hits` survives `docker compose down`.
4. Stop only the Redis service and observe how the web service fails; then add a clearer error response.
5. Run `docker compose config` and explain the fully rendered service definitions.

## Completion Rule

Finish each exercise only after verifying the behavior from the running stack:

```text
edit -> docker compose up --build -> curl the app -> inspect logs/state
```
