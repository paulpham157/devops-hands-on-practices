exports.handler = async (event) => {
  const params = new URLSearchParams(event.rawQuery || "");
  const name = params.get("name") || "serverless";

  return {
    statusCode: 200,
    headers: { "content-type": "application/json" },
    body: JSON.stringify({
      platform: "Netlify Functions",
      runtime: "nodejs",
      message: `hello ${name}`,
      eventType: "http",
    }),
  };
};

