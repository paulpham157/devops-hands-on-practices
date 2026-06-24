# Solution: Run a Vault Dev Server

The image is:

```text
hashicorp/vault:1.20
```

The Vault API and UI are exposed on:

```text
http://localhost:8200
```

The dev root token is:

```text
root
```

Dev mode is unsafe for production because the root token is known, storage is not production configured, and operational controls such as proper unseal, HA, audit, and access policy design are not in place.
