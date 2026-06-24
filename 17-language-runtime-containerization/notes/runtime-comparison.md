# Runtime Comparison Notes

Use these notes when deciding how to containerize a service.

## Python

Python services usually carry the Python interpreter and installed packages in the runtime image.

Strengths:

- simple developer workflow
- strong ecosystem for APIs, automation, data, and scripting
- fast iteration

Watch out for:

- dependency size
- native package build dependencies
- per-process concurrency model
- packaging virtual environments cleanly

## Java Spring

Spring Boot services usually compile into an executable jar and run on a JRE.

Strengths:

- mature enterprise framework
- strong dependency injection and configuration model
- good production ecosystem

Watch out for:

- JVM memory baseline
- slower startup than small compiled services
- large dependency graphs
- build cache and dependency download time

## Ruby

Ruby web services often run with Rack frameworks such as Sinatra or Rails.

Strengths:

- expressive syntax
- productive web development
- mature gem ecosystem

Watch out for:

- native gem dependencies
- Bundler cache behavior
- runtime image size
- process and thread model

## Go

Go services usually compile into one binary.

Strengths:

- small deployment artifact
- fast startup
- good standard library for HTTP services
- simple cross-compilation story

Watch out for:

- CGO and native dependency behavior
- module cache behavior
- binary flags and build metadata

## Rust

Rust services usually compile into one optimized binary.

Strengths:

- strong memory safety model
- low runtime overhead
- high performance
- predictable deployment artifact

Watch out for:

- compile time
- steeper learning curve
- dependency compilation cost
- runtime image compatibility when using native libraries

