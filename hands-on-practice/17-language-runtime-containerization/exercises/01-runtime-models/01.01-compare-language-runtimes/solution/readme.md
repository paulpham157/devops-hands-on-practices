# Solution: Compare Language Runtimes

Interpreter examples:

- Python Flask
- Ruby Sinatra

JVM example:

- Java Spring Boot

Native binary examples:

- Go HTTP
- Rust HTTP

Go and Rust are usually candidates for the smallest runtime images because their final image can contain only the compiled binary and minimal runtime libraries.

Java Spring usually has the heaviest baseline memory usage because it runs on a JVM and loads a larger framework stack.

