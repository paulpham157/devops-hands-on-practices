# Solution: Run the Safety Checks

The first test expects:

```text
docker-course-dev-nginx
http://localhost:8095
```

The second test overrides:

```hcl
environment = "test"
host_port   = 8096
```

`command = plan` is useful because it checks the planned values without creating a container. That makes tests faster, safer, and easier to run repeatedly.
