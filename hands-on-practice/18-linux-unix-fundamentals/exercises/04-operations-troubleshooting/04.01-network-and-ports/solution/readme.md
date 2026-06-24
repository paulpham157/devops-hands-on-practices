# Solution: Network and Ports

The hostname changes for each container. Use:

```bash
hostname
```

The `ip` and `ss` commands may be missing in minimal images.

A listening port means a process has opened a socket and is waiting for incoming connections.

Binding to `127.0.0.1` listens only on loopback inside that network namespace. Binding to `0.0.0.0` listens on all available interfaces, which is usually needed for a containerized service to accept traffic from outside the container.

