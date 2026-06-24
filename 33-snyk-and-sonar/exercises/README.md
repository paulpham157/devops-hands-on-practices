# Exercises: Snyk and Sonar

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-tooling-foundations/01.01-snyk-vs-sonar`
   - Separate security scanning from code quality analysis.

2. `01-tooling-foundations/01.02-shift-left-security-and-quality`
   - Understand how both tools support earlier feedback in development.

3. `02-snyk-workflows/02.01-open-source-container-iac-scanning`
   - Read Snyk scan surfaces and example results.

4. `02-snyk-workflows/02.02-snyk-monitor-and-remediation-thinking`
   - Understand monitored posture and remediation prioritization.

5. `03-sonar-workflows/03.01-static-analysis-and-quality-gates`
   - Read Sonar quality gate and static analysis concerns.

6. `03-sonar-workflows/03.02-new-code-coverage-and-clean-as-you-code`
   - Apply clean new code thinking instead of blocking on all legacy debt.

7. `04-pipeline-and-governance/04.01-combine-security-and-quality-gates`
   - Combine Snyk and Sonar policies in CI/CD.

8. `04-pipeline-and-governance/04.02-choose-the-right-gate-for-the-risk`
   - Choose the right blocking and warning policies for team maturity and risk.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
```

Then inspect:

```text
snyk/
sonar/
ci-cd/
policy-examples/
scenario-designs/
```

No account is required.

