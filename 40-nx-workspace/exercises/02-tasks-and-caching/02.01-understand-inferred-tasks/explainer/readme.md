# Explainer: Understand Inferred Tasks

Modern Nx plugins can infer tasks from tool configuration files.

For example, a Vite plugin can inspect Vite config and infer build or test targets. A Playwright plugin can inspect Playwright config and infer e2e tasks.

Inferred tasks reduce manual target configuration, but the team still needs to understand what was inferred and how it is cached.
