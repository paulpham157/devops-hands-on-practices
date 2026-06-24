# Production IaC Review Checklist

Use this checklist before merging IaC changes.

## Change Shape

- Does the plan, preview, diff, or change set show replacements?
- Are deletes expected and approved?
- Are generated names stable enough for the workload?
- Are dependencies explicit?

## Security

- Are IAM permissions least privilege?
- Are public access settings intentional?
- Are secrets stored outside source control?
- Are provider credentials scoped to the deployment target?

## State and Drift

- Is state remote, locked, and backed up when the tool requires state?
- Is drift detection part of operations?
- Is import documented for pre-existing resources?
- Are manual console changes discouraged or tracked?

## Team Workflow

- Is formatting automated?
- Are modules or constructs versioned?
- Are plans saved or attached to review?
- Is apply/deploy done by CI/CD rather than ad hoc laptops?

