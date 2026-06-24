# Publish Build Info

Build info records the relationship between:

- build name and build number.
- produced artifacts.
- dependencies.
- environment metadata.
- Git metadata.

This is valuable because promotion, scanning, audit, and rollback need to know which build produced which artifact.

JFrog CLI can upload artifacts and attach them to build info before publishing the build record.

