# Problem: Inspect State and Outputs

Apply the lesson if it is not already running:

```bash
./scripts/apply.sh
```

Inspect state:

```bash
tofu state list
tofu state show 'module.nginx_site.docker_container.nginx'
```

Inspect outputs:

```bash
tofu output
tofu output -raw container_url
```

Answer:

1. What is the full resource address of the Docker container?
2. What is the container name?
3. Which output is easiest for a smoke-test script to use?
4. Why should `terraform.tfstate` stay out of git?

Clean up when done:

```bash
./scripts/destroy.sh
```
