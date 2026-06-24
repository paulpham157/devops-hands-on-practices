# Solution: NGINX Round-Robin and Least Connections

The upstream group name is:

```text
course_api
```

Backends:

- `app-a:5000`
- `app-b:5000`
- `app-c:5000`

The configured strategy is:

```text
least_conn
```

If `least_conn` is removed, NGINX uses round-robin by default.

Least-connections can help when some requests are slower than others because it avoids sending too many new requests to a backend that is already busy.

