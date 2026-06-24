# Serverless Platform Map

## Core Platform Names

| Diagram Name | Current Product Area |
| --- | --- |
| AWS Lambda | AWS Lambda |
| Cloudflare | Cloudflare Workers |
| Azure Functions | Azure Functions |
| Vercel | Vercel Functions and Edge Functions |
| Netlify | Netlify Functions and Netlify Edge Functions |
| GCP Functions | Cloud Run functions; Cloud Functions v2/API and 1st gen still appear in product versions and tooling |

## Common Runtime Support

Runtime support changes over time. Always check current provider docs before choosing a runtime.

| Platform | Common Runtime Direction |
| --- | --- |
| AWS Lambda | Node.js, Python, Java, .NET, Go, Ruby, custom runtime/container image |
| Cloudflare Workers | JavaScript, TypeScript, WebAssembly, Workers runtime APIs |
| Azure Functions | C#, JavaScript/TypeScript, Python, Java, PowerShell, custom handlers |
| Vercel Functions | Node.js and framework-integrated functions; edge runtime for edge use cases |
| Netlify Functions | JavaScript/TypeScript and framework-integrated functions; edge functions |
| GCP Functions | Node.js, Python, Go, Java, .NET, Ruby, PHP, Cloud Run-based execution model |

## Trigger Map

| Trigger | AWS Lambda | Cloudflare Workers | Azure Functions | Vercel | Netlify | GCP Functions |
| --- | --- | --- | --- | --- | --- | --- |
| HTTP | API Gateway / Function URL / ALB | Fetch handler | HTTP trigger | route/function | function route | HTTP trigger |
| Schedule | EventBridge Scheduler | Cron Triggers | Timer trigger | cron jobs | scheduled functions | Cloud Scheduler/Eventarc |
| Queue | SQS | Queues | Storage Queue / Service Bus | external integration | external integration | Pub/Sub |
| Object storage | S3 event | R2 event patterns/integrations | Blob trigger | external integration | external integration | Cloud Storage event |
| Edge request | Lambda@Edge / CloudFront Functions | Workers | Front Door/edge patterns | Edge Functions | Edge Functions | Cloud CDN/edge patterns vary |
