# Packer Image Exercises

These exercises extend lesson 04. Initialize and validate the template first:

```bash
cd 04-packer-docker-image
packer init .
packer validate .
```

## Exercise Order

1. Change `files/index.html`, build the image, and verify the new page is served.
2. Add another package to the image and confirm it exists with `docker run`.
3. Change the image tag from `1.0` to `1.1`.
4. Add a second tag for `latest` and inspect both local images.
5. Compare the Packer build flow with a normal Dockerfile build and write down when each is useful.

## Completion Rule

Finish each exercise only after building and running the image:

```text
edit template/files -> packer fmt/validate -> packer build -> docker run/inspect
```
