# Read Rendered Compose Config

Expected observations:

- `web` has a `build` section that points at the lesson directory.
- `ports` shows the host-to-container mapping.
- The Redis service is reachable by the DNS name `redis` from the web container.
- Named volumes appear under top-level `volumes`.

Use this command when in doubt:

```bash
docker compose config --services
```
