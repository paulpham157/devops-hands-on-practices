# Solution: Lint the Dockerfile

The base image is:

```text
python:3.12-slim
```

The container switches away from root with:

```dockerfile
USER app
```

The Dockerfile copies only `app.py` because the sample app uses Python's standard library and does not need a package install layer.

Dockerfile linting is useful before build because it catches low-cost mistakes before they become runtime image problems.
