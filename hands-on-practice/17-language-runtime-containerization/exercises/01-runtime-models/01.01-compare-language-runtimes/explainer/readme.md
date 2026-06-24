# Explainer: Compare Language Runtimes

Containerizing an app depends on the runtime model.

Python and Ruby usually run source code with an interpreter. The runtime image needs the interpreter and installed packages or gems.

Java Spring usually compiles source code into bytecode, packages it as a jar, and runs it on a JVM.

Go and Rust usually compile source code into a native binary. The runtime image can be much smaller because it does not need the full compiler toolchain.

The key difference:

```text
interpreter runtime vs JVM runtime vs native binary runtime
```

