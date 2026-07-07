# Change Host Port

## Task

Change `host_port` from `8083` to `8084`.

Run:

```bash
terraform fmt
terraform validate
terraform plan
terraform apply
```

## Done When

`curl http://localhost:8084` reaches Nginx, and the plan output made sense before you applied it.
