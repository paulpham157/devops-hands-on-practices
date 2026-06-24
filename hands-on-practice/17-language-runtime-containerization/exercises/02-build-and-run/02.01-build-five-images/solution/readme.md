# Solution: Build Five Images

Expected pattern:

- Python and Ruby are often quick for small apps.
- Java takes longer because Maven downloads dependencies and packages a jar.
- Go is usually moderate and produces a compact binary.
- Rust can take longer because compilation is heavier.

Multi-stage builds:

- Java Spring
- Go HTTP
- Rust HTTP

On rebuild, Docker should reuse dependency layers if only application source changed. That is why dependency manifests are copied before source code.

