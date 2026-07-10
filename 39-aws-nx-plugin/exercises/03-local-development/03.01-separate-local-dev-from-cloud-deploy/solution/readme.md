# Solution: Separate Local Dev from Cloud Deploy

Local development can prove that projects build, local servers run, generated connections compile, and frontend-to-API calls work locally.

Deploy review or AWS-side testing proves IAM, Cognito domains, callback URLs, API exposure, state ownership, resource naming, and real account integration.

Local success does not prove IAM safety because IAM policies may only affect cloud resources. Deployment should use controlled credentials so cloud changes are auditable and limited.
