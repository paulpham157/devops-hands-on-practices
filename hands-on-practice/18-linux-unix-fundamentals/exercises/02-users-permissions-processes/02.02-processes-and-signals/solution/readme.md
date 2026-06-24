# Solution: Processes and Signals

The PID changes every run. Use `ps` to identify it.

`kill -TERM` sends `SIGTERM`, which asks the process to stop gracefully.

`false` returns a non-zero exit code, usually:

```text
1
```

`true` returns:

```text
0
```

`SIGKILL` should be a last resort because the process cannot clean up files, flush buffers, close connections, or run shutdown handlers.

