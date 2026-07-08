# Protect Local State and Secrets

State records what Terraform manages and often includes sensitive details.

Even when a lesson uses only local Docker resources, the habit should be the same: do not commit state files, and treat them as operational data.
