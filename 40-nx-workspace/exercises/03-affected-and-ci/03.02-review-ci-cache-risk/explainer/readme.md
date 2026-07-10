# Explainer: Review CI Cache Risk

Affected-only execution and caching are optimizations. They are not substitutes for correct task modeling.

Risk appears when:

- base/head is wrong
- dependency edges are missing
- cache inputs are incomplete
- environment-dependent tasks are cached unsafely
- generated files are not tracked

Fast CI is useful only when the skipped work is genuinely unnecessary.
