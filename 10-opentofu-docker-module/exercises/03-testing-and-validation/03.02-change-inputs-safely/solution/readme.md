# Solution: Change the Host Port

Port `8097` produces:

```text
http://localhost:8097
```

Port `80` should fail validation because `host_port` must be between `1024` and `65535`.

The validation exists in root `variables.tf` and in the child module `modules/nginx_site/variables.tf`.

This is safer than editing a resource block directly because the module keeps one controlled interface for users. The resource implementation stays stable while inputs change through validated variables.
