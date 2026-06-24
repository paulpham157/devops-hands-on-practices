# Lesson 01: Docker Compose with Flask and Redis

## Goal

Run a small Flask app and a Redis service together with Docker Compose. The app increments a Redis counter on every request.

## Files

- `compose.yaml`: defines the `web` and `redis` services.
- `Dockerfile`: builds the Flask app image.
- `app/app.py`: Flask application code.
- `app/requirements.txt`: Python dependencies.
- `app/templates/index.html`: simple response page.

## Run

```bash
cd hands-on-practice/01-docker-compose-flask-redis
docker compose up --build
```

Open:

```text
http://localhost:5001
```

Refresh the page. The counter should increase.

## Inspect

```bash
docker compose ps
docker compose logs -f web
docker compose exec redis redis-cli ping
docker compose exec redis redis-cli get page_hits
```

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

