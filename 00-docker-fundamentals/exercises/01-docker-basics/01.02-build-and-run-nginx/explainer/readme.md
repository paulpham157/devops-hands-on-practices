# Explainer: Build and Run a Container

The basic Docker loop is:

```text
docker build -> docker run -> docker inspect/logs -> docker rm
```

`docker build` turns a Dockerfile and build context into an image.

`docker run` creates a container from that image. Port publishing maps a host port to a container port:

```text
host:container
8080:80
```

The NGINX example is intentionally simple so you can focus on the command flow.
