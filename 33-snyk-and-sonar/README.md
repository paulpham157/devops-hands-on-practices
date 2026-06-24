# Lesson 33: Snyk and Sonar

## Goal

Learn how Snyk and Sonar fit into a modern DevSecOps and software quality workflow.

This lesson teaches:

- what Snyk and Sonar each solve
- how Snyk scans open source dependencies, containers, code, and IaC
- how Sonar analyzes code quality, maintainability, bugs, vulnerabilities, and coverage
- how quality gates and security gates work in CI/CD
- how to combine both tools without confusing their responsibilities

No account is required for the core exercises.

## Mental Model

```text
developer change -> local and CI analysis -> issue detection -> policy gate -> merge or remediation
```

The main split is:

- Snyk focuses on security and supply-chain risk across code, dependencies, containers, and infrastructure as code
- Sonar focuses on code quality and static analysis, including maintainability, bugs, smells, and quality gates

## Core Problems

| Problem | Typical Question |
| --- | --- |
| Dependency risk | Are we importing vulnerable packages? |
| Container and IaC risk | Are the image layers or infrastructure configs unsafe? |
| Code quality drift | Is new code introducing maintainability or bug risk? |
| Delivery governance | What should block a merge or deployment? |

## Lab Layout

```text
snyk/              Snyk CLI examples and result models
sonar/             Sonar configuration and quality gate examples
ci-cd/             Pipeline examples for combined use
policy-examples/   Gate policy examples
scenario-designs/  Team and risk scenarios
scripts/           Validation helper
exercises/         Structured hands-on practice
```

## Tool Split

| Tool | Main Scope | Good Fit | Main Tradeoff |
| --- | --- | --- | --- |
| Snyk | dependency, container, code, and IaC security | shift-left security checks and remediation guidance | security findings need triage discipline |
| Sonar | static analysis, maintainability, bugs, code smells, coverage, and quality gates | code quality governance and clean new code | quality gates can become noisy if poorly tuned |

## Snyk Notes

Snyk is commonly used for:

- open source dependency scanning
- container image scanning
- code scanning
- IaC scanning
- issue tracking and monitored project posture

Common CLI workflow:

- `snyk test`
- `snyk container test`
- `snyk iac test`
- `snyk monitor`

## Sonar Notes

Sonar is commonly used for:

- static code analysis
- maintainability and reliability feedback
- code coverage visibility
- quality gates on new code

The most useful Sonar setups emphasize clean new code rather than demanding a perfect legacy codebase before any progress can happen.

## Combined Pipeline Thinking

Snyk and Sonar complement each other:

- Snyk asks whether the software supply chain and code introduce security risk
- Sonar asks whether the codebase quality bar is being maintained

The pipeline should distinguish:

- security gate failures
- quality gate failures
- warning-only checks

## Production Questions

Before adopting these tools, answer:

1. Which risks should block merge versus only create backlog items?
2. Which scans must run in pull request time?
3. Which scans can run asynchronously after merge?
4. What quality gate belongs on new code only?
5. How will teams triage recurring findings instead of ignoring them?

## Validate

From this lesson directory:

```bash
./scripts/validate.sh
```

This checks:

- required lesson files
- shell script syntax
- YAML syntax
- JSON syntax
- properties file existence

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover tool positioning, shift-left practice, Snyk scan types, Sonar quality gates, new-code governance, and combined pipeline policies.

## References

- Snyk documentation: https://docs.snyk.io/
- Snyk CLI documentation: https://docs.snyk.io/snyk-cli
- Snyk Open Source: https://docs.snyk.io/scan-with-snyk/snyk-open-source
- Snyk Container: https://docs.snyk.io/scan-with-snyk/snyk-container
- Snyk Code and IaC: https://docs.snyk.io/scan-with-snyk
- SonarQube documentation: https://docs.sonarsource.com/sonarqube-server/
- SonarQube quality gates: https://docs.sonarsource.com/sonarqube-server/latest/quality-standards-administration/managing-quality-gates/introduction-to-quality-gates/

