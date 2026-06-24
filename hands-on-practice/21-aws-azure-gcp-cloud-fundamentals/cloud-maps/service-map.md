# AWS, Azure, and Google Cloud Service Map

This is a practical map for learning. It is not a perfect one-to-one equivalence table.

## Compute

| Need | AWS | Azure | Google Cloud |
| --- | --- | --- | --- |
| Virtual machines | EC2 | Azure Virtual Machines | Compute Engine |
| Autoscaling VMs | EC2 Auto Scaling | Virtual Machine Scale Sets | Managed instance groups |
| App platform | Elastic Beanstalk / App Runner | App Service / Container Apps | App Engine / Cloud Run |
| Batch jobs | AWS Batch | Azure Batch | Batch |

## Containers

| Need | AWS | Azure | Google Cloud |
| --- | --- | --- | --- |
| Managed Kubernetes | EKS | AKS | GKE |
| Container service | ECS / App Runner | Container Apps | Cloud Run |
| Registry | ECR | Azure Container Registry | Artifact Registry |
| Service mesh | App Mesh | Open Service Mesh / Istio add-ons | Cloud Service Mesh |

## Storage

| Need | AWS | Azure | Google Cloud |
| --- | --- | --- | --- |
| Object storage | S3 | Blob Storage | Cloud Storage |
| Block storage | EBS | Managed Disks | Persistent Disk / Hyperdisk |
| File storage | EFS / FSx | Azure Files | Filestore |
| Archive storage | S3 Glacier | Archive tier | Archive storage class |

## Databases

| Need | AWS | Azure | Google Cloud |
| --- | --- | --- | --- |
| Managed PostgreSQL/MySQL | RDS / Aurora | Azure Database for PostgreSQL/MySQL | Cloud SQL / AlloyDB |
| NoSQL key-value/document | DynamoDB | Cosmos DB | Firestore / Bigtable |
| Data warehouse | Redshift | Synapse Analytics | BigQuery |
| Cache | ElastiCache | Azure Cache for Redis | Memorystore |

## Networking

| Need | AWS | Azure | Google Cloud |
| --- | --- | --- | --- |
| Private network | VPC | Virtual Network | VPC network |
| Subnet | Subnet | Subnet | Subnet |
| Firewall | Security groups / NACLs | Network Security Groups | Firewall rules |
| Load balancer | Elastic Load Balancing | Azure Load Balancer / Application Gateway | Cloud Load Balancing |
| Private connectivity | PrivateLink / Direct Connect | Private Link / ExpressRoute | Private Service Connect / Cloud Interconnect |
| DNS | Route 53 | Azure DNS | Cloud DNS |

## Identity and Secrets

| Need | AWS | Azure | Google Cloud |
| --- | --- | --- | --- |
| IAM | IAM | Azure RBAC | Cloud IAM |
| Workforce identity | IAM Identity Center | Microsoft Entra ID | Cloud Identity |
| Workload identity | IAM roles | Managed identities | Service accounts / Workload Identity Federation |
| Secrets | Secrets Manager / SSM Parameter Store | Key Vault | Secret Manager |
| Key management | KMS | Key Vault Managed HSM / Key Vault keys | Cloud KMS |

## Serverless and Events

| Need | AWS | Azure | Google Cloud |
| --- | --- | --- | --- |
| Functions | Lambda | Azure Functions | Cloud Run functions, with Cloud Functions v2/1st gen still visible in APIs and docs |
| API gateway | API Gateway | API Management | API Gateway / Apigee |
| Event bus | EventBridge | Event Grid | Eventarc |
| Queue | SQS | Storage Queue / Service Bus Queue | Pub/Sub |
| Stream | Kinesis | Event Hubs | Pub/Sub / Dataflow |

## Observability

| Need | AWS | Azure | Google Cloud |
| --- | --- | --- | --- |
| Metrics/logs | CloudWatch | Azure Monitor | Cloud Monitoring / Cloud Logging |
| Tracing | X-Ray | Application Insights | Cloud Trace |
| Audit logs | CloudTrail | Activity Log | Cloud Audit Logs |
| Cost | Cost Explorer | Cost Management | Cloud Billing reports |
