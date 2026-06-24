# Solution: Portable Handler Shapes

AWS Lambda and Netlify Functions return `{ statusCode, body }`.

Cloudflare Workers exports `fetch(request)`.

Azure Functions uses `context`.

Vercel and Google Cloud HTTP functions use request/response style objects.

Separating business logic from platform adapter code makes testing easier and reduces migration cost.

