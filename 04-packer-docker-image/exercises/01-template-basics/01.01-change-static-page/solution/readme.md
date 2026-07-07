# Change Static Page

The important workflow is:

```bash
packer validate .
packer build .
docker run --rm -p 8082:80 docker-course/packer-nginx:1.0
```

If the old page still appears, confirm you rebuilt the image and are running the expected tag.
