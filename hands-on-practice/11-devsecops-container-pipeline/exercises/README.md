# Exercises: DevSecOps Container Pipeline

## Sections

1. `01-devsecops-basics`
   - Map the security feedback loop.
   - Threat model a container pipeline.

2. `02-static-and-secret-scanning`
   - Lint a Dockerfile.
   - Scan the repository for secrets, dependency issues, and configuration issues.

3. `03-image-security-and-sbom`
   - Build and scan a container image.
   - Generate and inspect a CycloneDX SBOM.

4. `04-policy-and-ci`
   - Run a local security gate.
   - Translate the same gate into CI.

## Completion Target

By the end, you should be able to explain:

- Which security checks belong before build, during build, and after build.
- Why secret scanning is usually the first gate to enforce.
- Why container image vulnerability results can change over time.
- How SBOMs support incident response and dependency review.
- How to turn local DevSecOps scripts into a CI policy gate.
