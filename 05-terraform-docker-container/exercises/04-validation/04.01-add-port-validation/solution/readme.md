# Add Port Validation

Example validation:

```hcl
validation {
  condition     = var.host_port >= 1024 && var.host_port <= 65535
  error_message = "host_port must be between 1024 and 65535."
}
```

Test by temporarily setting:

```hcl
host_port = 80
```

Then restore a valid lab port.
