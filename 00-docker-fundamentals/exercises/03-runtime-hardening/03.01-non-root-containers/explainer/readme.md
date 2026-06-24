# Explainer: Non-Root Containers

Containers share the host kernel. Running as root inside a container is not the same as full host root, but it increases blast radius when an escape, volume mount, or misconfiguration exists.

Prefer:

```dockerfile
RUN adduser ...
USER appuser
```

The application must still be able to read its files, write only where needed, and bind to its configured port.
