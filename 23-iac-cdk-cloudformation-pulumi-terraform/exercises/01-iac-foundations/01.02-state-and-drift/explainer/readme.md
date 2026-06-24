# State and Drift

State records what the IaC engine believes exists.

Drift happens when real infrastructure no longer matches the recorded desired state. Common causes:

- manual console edits.
- emergency production fixes.
- failed partial deployments.
- resources imported incorrectly.
- external systems changing shared resources.

CloudFormation stores stack state in AWS. Terraform/OpenTofu and Pulumi commonly use separate backends. That backend must be protected, locked, and backed up.

