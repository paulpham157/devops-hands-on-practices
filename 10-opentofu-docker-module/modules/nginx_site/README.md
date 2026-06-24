# Module: nginx_site

This module manages one local Nginx container with the Docker provider.

It intentionally stays small so the course can focus on module boundaries:

- The root module configures providers and environment-level inputs.
- This child module owns the Docker image and container resources.
- Outputs expose the values users and scripts need after apply.

## Inputs

| Name | Type | Description |
| --- | --- | --- |
| `container_name` | `string` | Name of the local Docker container. |
| `host_port` | `number` | Host port mapped to container port 80. |
| `image_name` | `string` | Docker image tag to run. |
| `keep_image_locally` | `bool` | Whether to keep the image after destroy. |

## Outputs

| Name | Description |
| --- | --- |
| `container_id` | Docker container ID. |
| `container_name` | Docker container name. |
| `container_url` | Local URL for browser testing. |
| `host_port` | Host port mapped to Nginx. |
| `image_name` | Docker image tag. |
