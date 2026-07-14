# Render Config from Compose Environment

## Task

Add `APP_MESSAGE` to `compose.yaml`, then read it from `app/app.py` and render it in the HTML page.

Verify with:

```bash
docker compose up --build
curl -fsS http://localhost:5001
```

## Done When

Changing the environment value in Compose changes the rendered response after rebuild or restart, without editing the image tag.
