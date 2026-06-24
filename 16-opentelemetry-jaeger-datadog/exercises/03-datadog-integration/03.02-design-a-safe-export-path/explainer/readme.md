# Explainer: Design a Safe Export Path

A production telemetry path needs more than "send everything to a vendor."

Consider:

- where collectors run
- how API keys are stored
- what sampling strategy is used
- how sensitive attributes are filtered
- which teams can change pipelines
- how cost is controlled
- how telemetry is retained

Safer pattern:

```text
app -> local collector -> central collector -> vendor backend
```

This gives teams a control point before telemetry leaves the environment.

