# Solution: Map the OpenTofu Concepts

1. `versions.tf` declares the Docker provider requirement.
2. `provider "docker" {}` in `main.tf` configures the provider.
3. The `module "nginx_site"` block in `main.tf` calls the child module.
4. `modules/nginx_site/main.tf` uses `docker_image.nginx` to pull the image.
5. `modules/nginx_site/main.tf` uses `docker_container.nginx` to run the container.
6. User-changeable inputs are in `variables.tf`: `project_name`, `environment`, `host_port`, `image_name`, and `keep_image_locally`.

The important boundary is that the root module decides environment-level inputs, while the child module owns the Docker resource details.
