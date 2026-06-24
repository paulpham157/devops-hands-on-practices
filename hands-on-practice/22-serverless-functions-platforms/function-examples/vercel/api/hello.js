export default function handler(request, response) {
  const name = request.query.name || "serverless";
  response.status(200).json({
    platform: "Vercel Functions",
    runtime: "nodejs",
    message: `hello ${name}`,
    eventType: "http",
  });
}

