FROM rust:1-slim-bookworm AS build

WORKDIR /src

COPY Cargo.toml .
RUN mkdir src && printf 'fn main() {}' > src/main.rs && cargo build --release

COPY src ./src
RUN cargo build --release

FROM gcr.io/distroless/cc-debian12:nonroot

WORKDIR /app

COPY --from=build /src/target/release/course-rust-http /app/server

EXPOSE 8080

USER nonroot:nonroot

ENTRYPOINT ["/app/server"]

