export default {
  async fetch(request) {
    const url = new URL(request.url);
    const name = url.searchParams.get("name") || "serverless";

    return Response.json({
      platform: "Cloudflare Workers",
      runtime: "workers",
      message: `hello ${name}`,
      eventType: "fetch",
    });
  },
};

