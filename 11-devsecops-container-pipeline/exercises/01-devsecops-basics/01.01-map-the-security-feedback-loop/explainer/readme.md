# Explainer: Map the Security Feedback Loop

DevSecOps is useful when security feedback arrives while the developer can still fix the problem cheaply.

In this lesson, the feedback loop is:

```text
write code -> lint Dockerfile -> scan source and secrets -> build image -> scan image -> generate SBOM -> gate CI
```

Each step answers a different question:

- Dockerfile lint: is the image build following basic container safety rules?
- Secret scan: did credentials get committed?
- Filesystem scan: are dependencies or config files risky?
- Image scan: did the final runtime image include known vulnerable packages?
- SBOM: can we list what went into the image?
- Gate: should this change be allowed to merge or release?

Fast checks should run earlier. Slower or noisier checks can still run, but their policy needs care.
