# Xray Policy Gates

JFrog Xray is used with Artifactory to detect supply-chain risk in artifacts and dependencies.

A release gate commonly checks:

- critical vulnerabilities.
- high vulnerabilities with fixes.
- malicious packages.
- disallowed licenses.
- policy exceptions with owner approval.

The goal is not to block every build forever. The goal is to block risky promotion while giving teams clear remediation paths.

