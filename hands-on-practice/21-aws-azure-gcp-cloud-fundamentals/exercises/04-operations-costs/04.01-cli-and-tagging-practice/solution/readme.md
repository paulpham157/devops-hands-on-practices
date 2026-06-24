# Solution: CLI and Tagging Practice

AWS caller identity:

```bash
aws sts get-caller-identity
```

Azure current account:

```bash
az account show --output table
```

Google Cloud auth identities:

```bash
gcloud auth list
```

Required tags or labels:

- `environment`
- `owner`
- `application`
- `cost-center`

Cost allocation fields are required so teams can understand who owns spend and where optimization work should happen.

