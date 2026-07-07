# Add Port Validation

## Task

Add validation to the `host_port` variable so it must be between `1024` and `65535`.

Test with one invalid value, then restore a valid value.

## Done When

`terraform validate` or `terraform plan` rejects the invalid port with a clear error message.
