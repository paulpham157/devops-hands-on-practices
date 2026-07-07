# Add Package

## Task

Add `curl` to the package installation step in `docker-nginx.pkr.hcl`.

Build the image and verify:

```bash
docker run --rm docker-course/packer-nginx:1.0 curl --version
```

## Done When

The command prints a curl version from inside the baked image.
