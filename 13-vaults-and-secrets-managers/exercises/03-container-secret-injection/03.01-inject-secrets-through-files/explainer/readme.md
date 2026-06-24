# Explainer: Inject Secrets Through Files

Containers often receive secrets as environment variables or mounted files.

Mounted files are usually better for sensitive values because:

- They avoid showing up in process environment dumps.
- File permissions can be restricted.
- Some platforms can rotate file-mounted secrets.
- Apps can read the secret only when needed.

This lesson exports a Vault value to:

```text
secrets/demo_api_token.txt
```

Docker Compose mounts it into the app as:

```text
/run/secrets/demo_api_token
```
