module.exports = async function (context, req) {
  const name = req.query.name || "serverless";
  context.res = {
    status: 200,
    headers: { "content-type": "application/json" },
    body: {
      platform: "Azure Functions",
      runtime: "nodejs",
      message: `hello ${name}`,
      eventType: "httpTrigger",
    },
  };
};

