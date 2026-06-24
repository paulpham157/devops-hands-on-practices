# Explainer: NGINX Load Balancing

NGINX can proxy requests to a group of upstream servers.

This lesson uses:

```text
nginx/default.conf
```

The upstream group contains:

- `app-a:5000`
- `app-b:5000`
- `app-c:5000`

`least_conn` sends new requests to the backend with the fewest active connections.

If `least_conn` is removed, NGINX uses round-robin by default.

