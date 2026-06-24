# Build and Test a Docker Image

In `docker/build-push-action`, change:

```yaml
tags: ${{ env.IMAGE_NAME }}:${{ github.sha }}
```

to:

```yaml
tags: |
  ${{ env.IMAGE_NAME }}:${{ github.sha }}
  ${{ env.IMAGE_NAME }}:latest
```

Then change the smoke test run command:

```bash
docker run -d --name ci-platform-sample "${IMAGE_NAME}:latest"
```

Keep the cleanup step:

```bash
docker rm -f ci-platform-sample >/dev/null 2>&1 || true
```
