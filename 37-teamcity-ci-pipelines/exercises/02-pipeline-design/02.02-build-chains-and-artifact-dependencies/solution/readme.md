# Build Chains and Artifact Dependencies

1. `Build and Test` publishes `reports/build-metadata.txt`.
2. `Container Package` consumes it into the `upstream/` directory.
3. Artifact flow preserves context and avoids recomputing or guessing upstream metadata in downstream steps.
