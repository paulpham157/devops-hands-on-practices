# Explainer: Optimize Cache and Size

Docker layer caching is most effective when stable files are copied before frequently changing files.

Good pattern:

```text
COPY dependency manifest
RUN dependency install
COPY source
RUN build
```

Image size improves when the final image excludes:

- compiler toolchains
- package manager caches
- test files
- build artifacts not needed at runtime
- temporary files

Multi-stage builds are the normal solution for Go, Rust, and Java packaging.

