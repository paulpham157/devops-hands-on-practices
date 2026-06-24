# Explainer: Build Five Images

Build behavior differs by stack.

Python and Ruby builds mostly install packages.

Java builds download dependencies and package a jar.

Go downloads modules and compiles a binary.

Rust compiles dependencies and the application binary. Rust builds can be slower, especially when dependencies are large.

This lesson lets you build one image at a time:

```bash
./scripts/build-one.sh python-flask
```

