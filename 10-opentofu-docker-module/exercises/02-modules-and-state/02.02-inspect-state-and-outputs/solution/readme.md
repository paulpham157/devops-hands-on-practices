# Solution: Inspect State and Outputs

The Docker container address is:

```text
module.nginx_site.docker_container.nginx
```

The default container name is:

```text
docker-course-dev-nginx
```

The easiest output for a smoke-test script is:

```bash
tofu output -raw container_url
```

Local state should stay out of git because state records real managed objects and can contain sensitive values in real infrastructure projects. Shared teams should use a remote backend or platform with locking, access control, and history.
