# Explainer: Compare IAM Models

Every cloud provider has identity and access management, but the models differ.

AWS uses IAM users, groups, roles, policies, and IAM Identity Center.

Azure uses Microsoft Entra ID for identity and Azure RBAC for access to Azure resources.

Google Cloud uses Cloud IAM policies attached to organizations, folders, projects, and resources. Workloads commonly use service accounts.

Use short-lived credentials and workload identity whenever possible.

