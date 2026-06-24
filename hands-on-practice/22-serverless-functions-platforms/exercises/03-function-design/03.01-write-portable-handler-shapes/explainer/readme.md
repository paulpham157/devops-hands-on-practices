# Explainer: Portable Handler Shapes

The business logic can be similar across platforms, but handler shape differs.

Examples:

- AWS Lambda receives an event object and returns `{ statusCode, body }`.
- Cloudflare Workers export a `fetch(request)` handler.
- Azure Functions receives `context` and `req`.
- Vercel API routes receive request and response objects.
- Netlify Functions return `{ statusCode, body }`.
- Google Cloud HTTP functions receive `req` and `res`.

Separate core business logic from platform adapter code where possible.

