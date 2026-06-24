exports.handler = async (event) => {
  const name = event.queryStringParameters?.name || "serverless";
  return {
    statusCode: 200,
    headers: { "content-type": "application/json" },
    body: JSON.stringify({
      platform: "AWS Lambda",
      runtime: "nodejs",
      message: `hello ${name}`,
      eventType: "http",
    }),
  };
};

