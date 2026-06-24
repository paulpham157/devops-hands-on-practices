exports.helloHttp = (req, res) => {
  const name = req.query.name || "serverless";
  res.status(200).json({
    platform: "Google Cloud Run functions",
    runtime: "nodejs",
    message: `hello ${name}`,
    eventType: "http",
  });
};

