# Serverless Decision Matrix

| Use Case | Strong Candidates | Reason |
| --- | --- | --- |
| AWS backend reacting to S3/SQS/DynamoDB | AWS Lambda | Deep AWS event integration |
| Low-latency edge request rewrite | Cloudflare Workers, Vercel Edge, Netlify Edge | Runs close to users |
| Enterprise Azure app with Service Bus and Entra ID | Azure Functions | Azure-native triggers and identity |
| Next.js app API route | Vercel Functions | Tight web framework workflow |
| Jamstack form/webhook backend | Netlify Functions | Site-adjacent deploy workflow |
| Google Cloud Pub/Sub or Cloud Storage event | Cloud Run functions | Google Cloud event integration through Cloud Run functions, Eventarc, and related Cloud Functions APIs/tooling |
| Long-running job | Usually not request-response function | Use queue + worker/container/job service |
| High-throughput stateful service | Usually not basic serverless function | Consider containers, Kubernetes, or stateful service |
