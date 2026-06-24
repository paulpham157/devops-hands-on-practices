# Explainer: Read Dockerfiles

Good Dockerfiles separate dependency restore from application source code.

This improves cache reuse:

```text
COPY dependency manifest
RUN install dependencies
COPY source code
RUN build or start app
```

Compiled languages often use multi-stage builds:

```text
builder image with compiler -> runtime image without compiler
```

The final image should contain only what the app needs to run.

