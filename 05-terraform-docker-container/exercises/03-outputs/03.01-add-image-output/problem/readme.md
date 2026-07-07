# Add Image Output

## Task

Add an output named `image_name` to `outputs.tf`.

It should show the image used by the Docker container.

Run:

```bash
terraform fmt
terraform validate
terraform apply
terraform output image_name
```

## Done When

`terraform output image_name` prints the image reference.
