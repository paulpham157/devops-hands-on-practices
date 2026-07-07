# Add Package and Check Mode

The package list should include the new package:

```yaml
docker_host_packages:
  - ca-certificates
  - curl
  - gnupg
  - jq
```

The important observation is not the exact package. It is the transition:

```text
would change -> changed -> ok
```
