# Explainer: Choose Platform for Use Case

Choose based on where the workload lives.

If the workload is deep inside AWS events, AWS Lambda is usually natural.

If the workload is edge request handling, Cloudflare Workers or edge functions are strong candidates.

If the workload belongs to a web framework deploy on Vercel or Netlify, use their functions first.

If the workload is Azure or Google Cloud event-driven, use the native platform.

