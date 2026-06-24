# Build and Smoke Test an Image

Change:

```python
"message": "Jenkins CI sample app",
```

to:

```python
"message": "Jenkins pipeline practice",
```

The smoke test checks `/healthz`, not `/`, so the image should still pass if the app starts correctly.

Useful verification inside the Docker sidecar:

```bash
docker compose exec docker docker image ls docker-course/jenkins-sample-app
```

