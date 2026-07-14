# Lesson 01: Docker Compose with FastAPI and Redis

## Goal

Run a small FastAPI app and a Redis service together with Docker Compose. The app increments a Redis counter on every request.

## Navigation

- Previous lesson: `00-docker-fundamentals`
- Next lesson: `02-kubernetes-nginx`

## Related Lessons

- `00-docker-fundamentals`
- `02-kubernetes-nginx`
- `03-ansible-docker-host`

## Files

- `compose.yaml`: defines the `web` and `redis` services.
- `Dockerfile`: builds the FastAPI app image.
- `app/app.py`: FastAPI application code.
- `app/requirements.txt`: Python dependencies.
- `app/templates/index.html`: simple response page.

## Prerequisites and Entry Check

- Docker Engine with `docker compose`.
- Completion of `00-docker-fundamentals`, or equivalent evidence that you can build and run a Docker image.

Entry check: explain what a service, network, volume, and health check do in a Compose file before starting the lab.

## Run

```bash
cd 01-docker-compose-fastapi-redis
docker compose up --build
```

Open:

```text
http://localhost:5001
```

FastAPI's interactive API documentation is available at [http://localhost:5001/docs](http://localhost:5001/docs).

Refresh the page. The counter should increase.

## Inspect

```bash
docker compose ps
docker compose logs -f web
docker compose exec redis redis-cli ping
docker compose exec redis redis-cli get page_hits
```

## Optional Queue Endpoint

The reference system introduced for advanced lessons reuses this app's order endpoint. You do not need it for the core Compose lesson, but you can queue a local demo order with:

```bash
curl --request POST http://localhost:5001/orders \
  --header 'Content-Type: application/json' \
  --data '{"id":"demo-order"}'
```

This only adds an item to Redis list `order_queue`; it does not create a durable acknowledged delivery workflow. The reference system adds a worker to consume it.

## Practice Tasks

1. Change the host port from `5001` to `8081`.
2. Add a new environment variable named `APP_MESSAGE`.
3. Read `APP_MESSAGE` in `app.py` and render it on the page.
4. Stop Redis and observe how the web service behaves.
5. Add a Redis volume so data survives `docker compose down`.

## Clean Up

```bash
docker compose down
```

Use this when you also want to remove volumes:

```bash
docker compose down --volumes
```
