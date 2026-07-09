# Local Workflow Notes

This lesson does not require creating a real workspace. Use this file to reason about a real local workflow before running generators.

## Read-Only Planning Loop

1. Choose the app shape: website, API, agent, infrastructure, or a connected full-stack app.
2. Choose the infrastructure provider: CDK or Terraform.
3. Write the intended generator sequence.
4. Add `--dry-run` to each generator command when exploring in an existing workspace.
5. Review generated files before committing.
6. Run local dev only after dependencies install cleanly.
7. Deploy only after IAM, auth, environment variables, and generated IaC are reviewed.

## Local Dev Boundary

Local development can prove:

- workspace projects build
- frontend and backend run locally
- generated connection code compiles
- local API calls work

Local development does not prove:

- IAM policies are least privilege
- Cognito domain and callback URLs are production-ready
- generated infrastructure is approved for deployment
- AWS account, region, and billing controls are correct

## Production Review Boundary

Before deployment, review:

- generated CDK diff or Terraform plan
- IAM permissions
- API exposure model
- auth callback URLs and domains
- environment variable and secret handling
- generated resource naming and tags
- state backend or CloudFormation stack ownership
