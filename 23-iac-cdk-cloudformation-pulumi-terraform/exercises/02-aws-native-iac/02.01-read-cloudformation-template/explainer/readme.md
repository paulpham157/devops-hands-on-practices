# Read a CloudFormation Template

CloudFormation templates describe AWS resources as structured YAML or JSON.

In `cloudformation/s3-bucket.yaml`, notice:

- `Parameters` define deploy-time inputs.
- `Resources` define AWS resources.
- `Outputs` expose values after deployment.
- `Ref` and `Fn::GetAtt` connect resources without hardcoding names.

CloudFormation owns stack lifecycle, rollback behavior, and stack events.

