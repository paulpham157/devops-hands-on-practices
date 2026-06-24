# Explainer: Compare Dockerfiles

Dockerfiles are operational documents. They describe build inputs, runtime dependencies, users, ports, and startup commands.

Look for:

- Floating tags such as `latest`
- Package installs without cleanup
- Build tools left in runtime images
- Containers running as root
- Missing `WORKDIR`
- Startup commands that do not clearly launch the intended process

Not every example in this lesson is production-ready. Some are deliberately simple so you can practice review.
