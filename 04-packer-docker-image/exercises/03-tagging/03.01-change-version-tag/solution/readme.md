# Change Version Tag

The template should produce:

```text
docker-course/packer-nginx:1.1
```

Run:

```bash
packer validate .
packer build .
docker run --rm -p 8082:80 docker-course/packer-nginx:1.1
```

Keep lesson commands aligned with the tag you choose.
