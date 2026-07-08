# Inspect Baked Image Contents

## Task

After adding a package or changing content, inspect the baked image:

```bash
docker run --rm docker-course/packer-nginx:1.0 ls -l /usr/share/nginx/html
docker run --rm docker-course/packer-nginx:1.0 sh -c 'which curl || true'
```

Answer:

1. Which file proves your HTML content was baked in?
2. Which command proves the package exists inside the image?
3. Why is this better than assuming the provisioner worked?

## Done When

You can verify a Packer change from the runtime image, not only from the template file.
