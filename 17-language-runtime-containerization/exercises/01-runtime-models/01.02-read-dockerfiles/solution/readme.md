# Solution: Read Dockerfiles

Single-stage Dockerfiles:

- `apps/python-flask/Dockerfile`
- `apps/ruby-sinatra/Dockerfile`

Multi-stage Dockerfiles:

- `apps/java-spring/Dockerfile`
- `apps/go-http/Dockerfile`
- `apps/rust-http/Dockerfile`

Dependency manifests copied early:

- Python: `requirements.txt`
- Java: `pom.xml`
- Ruby: `Gemfile`
- Go: `go.mod`
- Rust: `Cargo.toml`

All examples are intended to run as non-root in the final container.

The Java, Go, and Rust final images do not include the full compiler toolchain.

