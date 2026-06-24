# Explainer: Root Module and Child Module

An OpenTofu module is a directory of `.tf` files.

The lesson root is the root module. It is the entry point for the CLI.

The child module is:

```text
modules/nginx_site
```

The root module handles:

- Provider configuration
- Environment naming
- User-facing variables
- Outputs for the whole lesson

The child module handles:

- Docker image resource
- Docker container resource
- Resource-level validation and outputs

This keeps the reusable Docker/Nginx behavior separate from lab-specific naming.
