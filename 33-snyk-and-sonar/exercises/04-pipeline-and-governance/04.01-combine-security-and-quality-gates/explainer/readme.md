# Combine Security and Quality Gates

CI policy should reflect different kinds of risk.

Examples:

- block on critical security findings in changed production paths
- block on failed new-code quality gate
- warn on lower-risk legacy issues outside the current change

One blunt gate for everything is rarely effective.

