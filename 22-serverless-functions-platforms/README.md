# Lesson 22: Serverless Functions Platforms

## Goal

Learn serverless functions using the platforms shown in the diagram:

- AWS Lambda
- Cloudflare Workers
- Azure Functions
- Vercel Functions
- Netlify Functions
- GCP Functions, mapped in current Google Cloud docs to Cloud Run functions; Cloud Functions v2/API and 1st gen still appear in product versions and tooling

This lesson teaches:

- what serverless means
- function invocation models
- HTTP functions, event functions, and scheduled functions
- edge functions vs regional functions
- cold starts, concurrency, timeout, memory, and cost
- platform-specific handler shapes
- deployment and local development tools
- security, observability, and production failure modes

No cloud account is required for the core exercises.

## Mental Model

```text
event -> platform runtime -> function handler -> response or side effect
```

The platform owns most infrastructure:

- servers
- scaling
- runtime startup
- event routing
- deployment target
- logs and metrics integration

You own:

- function code
- dependencies
- configuration
- secrets
- IAM permissions
- idempotency
- observability
- cost controls

## Platform Comparison

| Platform | Common Fit | Runtime Location | Trigger Style |
| --- | --- | --- | --- |
| AWS Lambda | cloud-native event-driven backend | regional AWS | HTTP, queue, stream, storage, schedule, many AWS events |
| Cloudflare Workers | edge APIs, middleware, low-latency global routing | Cloudflare edge | HTTP fetch, queues, cron, Durable Objects, KV/R2 bindings |
| Azure Functions | Azure event-driven apps and enterprise integrations | regional Azure | HTTP, timers, queues, Event Grid, Service Bus, storage |
| Vercel Functions | frontend-adjacent APIs for web apps | Vercel serverless/edge regions | HTTP route handlers, background/scheduled patterns |
| Netlify Functions | Jamstack and site-adjacent backend functions | Netlify functions runtime/edge | HTTP functions, background, scheduled, edge |
| GCP Functions | Google Cloud event-driven functions | Cloud Run functions, with Cloud Functions v2/API and 1st gen still visible in versions and tooling | HTTP, Pub/Sub, Cloud Storage, Eventarc events |

## Lab Layout

```text
function-examples/     Minimal handler examples for each platform
platform-maps/         Comparison tables and trigger maps
scenario-designs/      Architecture scenario exercises
notes/                 Production notes
scripts/               Validation helper
exercises/             Structured hands-on practice
```

## Function Types

| Type | Meaning | Example |
| --- | --- | --- |
| HTTP function | request in, response out | API endpoint |
| Event function | event in, side effect out | object uploaded, queue message received |
| Scheduled function | time trigger | cleanup job every night |
| Edge function | function close to user | request rewriting, auth gate, personalization |
| Background function | async work after request | email, image processing, webhook processing |

## Handler Shape Examples

Each platform has a different handler shape:

```text
function-examples/aws-lambda/index.js
function-examples/cloudflare-worker/worker.js
function-examples/azure-functions/function.json
function-examples/vercel/api/hello.js
function-examples/netlify/netlify/functions/hello.js
function-examples/gcp-functions/index.js
```

The logic is intentionally similar: return a JSON hello response with platform metadata.

## Serverless Tradeoffs

Benefits:

- scale to zero
- pay per use
- fast deployment for small functions
- managed event integrations
- less server maintenance

Costs and risks:

- cold starts
- runtime and timeout limits
- provider-specific event formats
- harder local parity
- hidden cost spikes
- observability fragmentation
- state management constraints
- vendor lock-in

## Production Notes

For production serverless:

- use currently supported managed runtimes, for example Node.js 24 where the provider supports it.
- keep functions small and single-purpose.
- make handlers idempotent.
- set timeouts intentionally.
- configure memory based on measured latency and cost.
- use managed secrets, never hardcode secrets.
- restrict IAM permissions per function.
- add structured logs with request IDs.
- monitor errors, duration, throttles, retries, and cost.
- use queues for bursty workloads.
- avoid doing long-running work in request-response functions.
- test event payloads and retry behavior.
- keep dependencies small to reduce cold start impact.
- check provider runtime lifecycle pages before starting new work; supported runtimes, plans, timeout limits, concurrency behavior, and compatibility-date behavior change over time.

## Validate

```bash
./scripts/validate.sh
```

This checks:

- JavaScript syntax for handler examples when Node.js is available
- JSON syntax
- YAML syntax
- shell script syntax
- required lesson files

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover serverless fundamentals, invocation models, platform mapping, platform selection, handler shapes, events/bindings, cold starts, cost, security, observability, and deployment design.

## References

- AWS Lambda documentation: https://docs.aws.amazon.com/lambda/
- Cloudflare Workers documentation: https://developers.cloudflare.com/workers/
- Azure Functions documentation: https://learn.microsoft.com/azure/azure-functions/
- Vercel Functions documentation: https://vercel.com/docs/functions
- Netlify Functions documentation: https://docs.netlify.com/functions/overview/
- Google Cloud Run functions documentation: https://cloud.google.com/functions/docs
