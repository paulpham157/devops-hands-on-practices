# Solution: Non-Root Containers

Expected user:

```text
appuser
```

The important outcome is not just setting `USER`. The application must still start and serve requests.

If a non-root image fails, check:

- File ownership under `WORKDIR`
- Write paths for cache, logs, and temp files
- Privileged ports below `1024`
- Runtime directories created by the base image
