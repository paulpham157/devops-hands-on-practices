# Explainer: State and Outputs

State is OpenTofu's record of managed objects.

After apply, state connects configuration addresses to real Docker objects:

```text
module.nginx_site.docker_image.nginx
module.nginx_site.docker_container.nginx
```

Outputs are selected values that a human, script, or another stack can read.

Useful commands:

```bash
tofu state list
tofu state show 'module.nginx_site.docker_container.nginx'
tofu output
tofu output -raw container_url
```

State can contain sensitive information for real infrastructure. Do not commit local state files.
