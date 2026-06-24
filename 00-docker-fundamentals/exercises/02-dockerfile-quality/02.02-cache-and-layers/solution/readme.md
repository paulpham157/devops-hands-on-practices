# Solution: Cache and Layers

Expected reasoning:

1. The less optimized Dockerfile usually has multiple package operations split across layers.
2. The improved Dockerfile combines package install and cleanup in one `RUN`.
3. A cache-friendly Dockerfile copies dependency manifests before copying the full source tree.
4. Changing dependency files such as `package.json`, `requirements.txt`, `go.mod`, or `Cargo.toml` should rebuild the dependency layer. Changing only app source should not reinstall dependencies when the Dockerfile is ordered well.

The exact image size can differ by base image updates, so focus on relative behavior and Dockerfile structure.
