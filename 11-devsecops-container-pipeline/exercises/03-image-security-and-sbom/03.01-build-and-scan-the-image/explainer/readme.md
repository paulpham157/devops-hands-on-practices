# Explainer: Build and Scan the Image

Repository scans are useful, but the final image can include extra packages from the base image and build steps.

The image scan checks the built runtime artifact:

```bash
./scripts/build-image.sh
./scripts/scan-image.sh
```

Image vulnerability results can change without code changes because scanner databases and package advisories are updated over time.

That is why local training often starts with report-only image scans, then teams decide which severity and exploitability rules should block releases.
