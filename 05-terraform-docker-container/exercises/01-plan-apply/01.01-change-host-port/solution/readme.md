# Change Host Port

The variable value should become:

```hcl
host_port = 8084
```

Verify:

```bash
terraform output
docker ps --filter name=docker-course-terraform-nginx
curl -fsS http://localhost:8084
```

If `8083` still responds, check for an old container.
