# Change Static Page

## Task

Edit `files/index.html` and change the visible page text.

Run:

```bash
packer fmt .
packer validate .
packer build .
docker run --rm -p 8082:80 docker-course/packer-nginx:1.0
```

## Done When

`curl http://localhost:8082` returns your updated text.
