# Solution: Write and Read KV Secrets

The path is:

```text
secret/docker-course
```

The script writes with:

```bash
vault kv put secret/docker-course api_token=local-demo-token username=course-user
```

The fields are:

```text
api_token
username
```

Application code should avoid logging these fields because logs are often shipped to shared systems, retained for a long time, and readable by more people than the secret store.
