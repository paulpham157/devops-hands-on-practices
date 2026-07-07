# Add Image Output

One possible output:

```hcl
output "image_name" {
  description = "Docker image used by the Nginx container."
  value       = docker_image.nginx.name
}
```

Then run:

```bash
terraform output image_name
```
