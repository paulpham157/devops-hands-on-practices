# Explainer: Cache and Layers

Each Dockerfile instruction can create a layer. Docker reuses cached layers when inputs have not changed.

Good cache shape:

```text
copy dependency manifest -> install dependencies -> copy source
```

Poor cache shape:

```text
copy all source -> install dependencies
```

The poor shape invalidates dependency installation whenever any source file changes.

Package cleanup should happen in the same `RUN` instruction as package installation. Cleaning in a later layer does not remove bytes from the earlier layer.
