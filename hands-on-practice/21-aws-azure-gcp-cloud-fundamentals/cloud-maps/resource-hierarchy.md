# Resource Hierarchy Map

## AWS

```text
AWS Organization
  Organizational Units
    AWS Accounts
      Regions
        VPCs, EC2, RDS, EKS, S3, IAM resources
```

AWS accounts are strong isolation and billing boundaries.

IAM is global within an account, while many services are regional.

## Azure

```text
Microsoft Entra tenant
  Management groups
    Subscriptions
      Resource groups
        Azure resources
```

Subscriptions are billing and management boundaries.

Resource groups group related resources for lifecycle and access management.

## Google Cloud

```text
Organization
  Folders
    Projects
      Resources
```

Projects are core isolation, quota, billing, and IAM boundaries.

Many resources are regional or zonal, while IAM policy can be attached at organization, folder, project, or resource level.

