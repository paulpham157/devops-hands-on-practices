# Instrument a Business Endpoint

Metrics become useful when labels describe user-facing behavior. This app already labels HTTP metrics by `service`, `method`, `endpoint`, and `status`.

The `endpoint` label comes from Flask's route function name. If you add a route like `checkout()`, Prometheus should show a new `endpoint="checkout"` time series after traffic hits the route.

The goal is not to add a new metric for every feature. The goal is to keep a small, stable set of metrics with labels that let you answer operational questions.

