# Explainer: Design a CI Review Loop

Generated code needs the same review path as hand-written code.

A useful CI loop should format, lint, typecheck, build, run local tests, and produce infrastructure review artifacts. For AWS changes, deployment should happen only from controlled branches or environments.

Dry-run generator output is useful during exploration, but committed generated code still needs normal CI.
