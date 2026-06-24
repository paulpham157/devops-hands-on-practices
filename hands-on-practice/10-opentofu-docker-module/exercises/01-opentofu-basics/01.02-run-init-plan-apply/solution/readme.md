# Solution: Run the Workflow

The default plan should create two resources:

```text
module.nginx_site.docker_image.nginx
module.nginx_site.docker_container.nginx
```

The resources are owned by the child module:

```text
module.nginx_site
```

The default host port is:

```text
8095
```

A successful HTTP check should return a status line similar to:

```text
HTTP/1.1 200 OK
```

After `tofu destroy`, `docker ps --filter name=docker-course-dev-nginx` should not show the lab container.
