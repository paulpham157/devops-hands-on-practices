# Lesson 04: Build an Image with Packer

## Goal

Use Packer to bake a Docker image with Nginx and a static page.

Packer is often used to build VM images such as AMIs or VirtualBox boxes. This lesson uses the Docker builder so the workflow stays local and fast.

## Navigation

- Previous lesson: `03-ansible-docker-host`
- Next lesson: `05-terraform-docker-container`

## Related Lessons

- `03-ansible-docker-host`
- `05-terraform-docker-container`
- `17-language-runtime-containerization`

## Prerequisites and Entry Check

- Completion of `00-docker-fundamentals`, or equivalent ability to inspect and run a Docker image.
- Packer and Docker installed locally.

Entry check: explain the difference between a baked image and a running container before executing `packer build`.

## Build

```bash
cd 04-packer-docker-image
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
