# Solution: Trace a Variable Through the Module

1. The default is set in root `variables.tf`:

```hcl
default = 8095
```

2. The root `main.tf` passes it into the child module:

```hcl
host_port = var.host_port
```

3. The child module uses it in `modules/nginx_site/main.tf`:

```hcl
ports {
  internal = 80
  external = var.host_port
}
```

4. The child module builds `container_url`, and root `outputs.tf` exposes that output.

This is the normal flow: root input -> module argument -> child variable -> resource argument -> output.
