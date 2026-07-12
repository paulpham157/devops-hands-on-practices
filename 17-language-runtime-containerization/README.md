# Lesson 17: Python, Java Spring, Ruby, Go, and Rust Containers

## Goal

Learn how common application runtimes differ when you build and run them in containers.

This lesson compares:

- Python with Flask
- Java with Spring Boot
- Ruby with Sinatra
- Go with the standard `net/http` package
- Rust with the standard library

The point is not to decide that one language is always best. The point is to understand runtime shape, Dockerfile pattern, dependency caching, image size, startup behavior, and operational tradeoffs.

## Navigation

- Previous lesson: `16-opentelemetry-jaeger-datadog`
- Next lesson: `18-linux-unix-fundamentals`

## Related Lessons

- `00-docker-fundamentals`
- `04-packer-docker-image`
- `18-linux-unix-fundamentals`

## Mental Model

```text
source code -> dependency restore -> build or package -> runtime image -> HTTP service
```

Different languages change the middle of the pipeline:

| Stack | Typical Build Shape | Runtime Shape |
| --- | --- | --- |
| Python | install packages from `requirements.txt` | interpreter plus site packages |
| Java Spring | compile/package with Maven or Gradle | JVM plus executable jar |
| Ruby | install gems with Bundler | interpreter plus gems |
| Go | compile static-ish binary | small runtime with one binary |
| Rust | compile optimized binary | small runtime with one binary |

## Lab Layout

```text
apps/python-flask/    Flask app and Dockerfile
apps/java-spring/     Spring Boot app, Maven pom, and Dockerfile
apps/ruby-sinatra/    Sinatra app and Dockerfile
apps/go-http/         Go HTTP app and Dockerfile
apps/rust-http/       Rust HTTP app and Dockerfile
compose.yaml          Run all services together
scripts/              Build, smoke test, and validate helpers
notes/                Comparison notes
exercises/            Structured hands-on practice
```

## Service Ports

| Service | URL |
| --- | ---: |
| Python Flask | http://localhost:5117 |
| Java Spring | http://localhost:5118 |
| Ruby Sinatra | http://localhost:5119 |
| Go HTTP | http://localhost:5120 |
| Rust HTTP | http://localhost:5121 |

Every service exposes:

```text
GET /
GET /healthz
GET /work
```

## Prerequisites and Entry Check

- Completion of `00-docker-fundamentals` and `01-docker-compose-flask-redis`, or equivalent container evidence.
- Docker Engine with `docker compose` for the optional runtime builds.

Entry check: identify the difference between a build image and a runtime image, and explain why a container should normally run as a non-root user.

## Run

Build one image:

```bash
./scripts/build-one.sh python-flask
```

Run all services:

```bash
docker compose up --build
```

Smoke test:

```bash
./scripts/smoke-test.sh
```

Stop:

```bash
docker compose down
```

## Runtime Comparison

| Topic | Python | Java Spring | Ruby | Go | Rust |
| --- | --- | --- | --- | --- | --- |
| Startup | Usually fast | Slower than small compiled services | Usually fast | Fast | Fast |
| Build time | Usually light | Moderate to heavy | Usually light | Moderate | Can be heavy |
| Runtime memory | Moderate | Higher JVM baseline | Moderate | Low | Low |
| Image pattern | interpreter image | build jar, run on JRE | interpreter image | multi-stage binary | multi-stage binary |
| Dependency cache | `requirements.txt` | `pom.xml` or Gradle files | `Gemfile` | `go.mod`, `go.sum` | `Cargo.toml`, `Cargo.lock` |
| Good fit | scripting, APIs, data apps | enterprise services | web apps, scripts | small services, CLIs | performance-sensitive services |

## Dockerfile Patterns

Python and Ruby usually ship an interpreter plus installed dependencies.

Java Spring usually builds an executable jar and runs it on a JRE image.

Go and Rust usually use multi-stage builds:

```text
builder image -> compiled binary -> smaller runtime image
```

That split keeps compilers and build caches out of the runtime image.

## Production Notes

For production containers:

- Copy dependency manifest files before source code to improve Docker layer caching.
- Use multi-stage builds for compiled languages.
- Run as a non-root user.
- Expose only the application port.
- Add health checks in Compose or Kubernetes.
- Pin major runtime versions intentionally.
- Avoid installing compilers in runtime images unless needed.
- Keep build-time secrets out of final images.
- Prefer immutable image tags for deployments.
- Measure image size and startup time instead of guessing.

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover runtime comparison, Dockerfile reading, image builds, HTTP smoke tests, cache optimization, image-size thinking, and language selection tradeoffs.

## Cleanup

```bash
docker compose down --remove-orphans
```

Remove locally built images only when you no longer need them for comparison:

```bash
docker image prune
```

## References

- Python documentation: https://docs.python.org/3/
- Spring Boot container image documentation: https://docs.spring.io/spring-boot/reference/packaging/container-images/
- Ruby documentation: https://www.ruby-lang.org/en/documentation/
- Go documentation: https://go.dev/doc/
- Rust book: https://doc.rust-lang.org/book/
- Dockerfile reference: https://docs.docker.com/reference/dockerfile/
