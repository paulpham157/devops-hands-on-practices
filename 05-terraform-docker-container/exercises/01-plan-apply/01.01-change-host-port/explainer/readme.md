# Change Host Port

Terraform compares configuration with state, then creates a plan.

Changing `host_port` changes how the local Docker container is published. The plan tells you whether Terraform can update in place or must recreate the container.
