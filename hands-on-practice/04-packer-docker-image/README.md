# Lesson 04: Build an Image with Packer

## Goal

Use Packer to bake a Docker image with Nginx and a static page.

Packer is often used to build VM images such as AMIs or VirtualBox boxes. This lesson uses the Docker builder so the workflow stays local and fast.

## Build

```bash
cd hands-on-practice/04-packer-docker-image
packer init .
packer fmt .
packer validate .
packer build .
```

## Run the Baked Image

```bash
docker run --rm -p 8082:80 docker-course/packer-nginx:1.0
```

Open:

```text
http://localhost:8082
```

## Inspect

```bash
docker image inspect docker-course/packer-nginx:1.0
docker run --rm docker-course/packer-nginx:1.0 nginx -v
```

## Practice Tasks

1. Change the HTML content in `files/index.html`.
2. Add `curl` to the package install list.
3. Change the tag from `1.0` to `1.1`.
4. Add a second post-processor tag named `latest`.
5. Compare this with a normal Dockerfile build.

## Clean Up

```bash
docker image rm docker-course/packer-nginx:1.0
```

