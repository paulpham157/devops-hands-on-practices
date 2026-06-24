# Solution: Inject Secrets Through Files

The generated local file is:

```text
secrets/demo_api_token.txt
```

The container receives it at:

```text
/run/secrets/demo_api_token
```

The app does not print the full token. It returns the secret length and a masked preview.

Masking is useful for demos and debugging, but the real control is preventing unnecessary reads and logs in the first place.
