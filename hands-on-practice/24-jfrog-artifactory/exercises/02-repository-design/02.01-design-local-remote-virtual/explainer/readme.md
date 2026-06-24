# Design Local, Remote, and Virtual Repositories

A strong repository layout separates lifecycle and source.

For each package format, create local repositories for internally produced artifacts, remote repositories for external upstreams, and virtual repositories for stable client configuration.

Example:

```text
npm-release-local + npmjs-remote -> npm-virtual
```

CI can publish to local repositories. Developers and builds can read from virtual repositories.

