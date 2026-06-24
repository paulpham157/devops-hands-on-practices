# Terraform Extension Patterns

Terraform can be extended without changing Terraform core.

## 1. Module Extension

Use modules when your team repeats the same resource pattern:

- standard tags.
- encryption defaults.
- logging defaults.
- naming rules.
- IAM boundaries.
- account or environment conventions.

The sample module in `../modules/tagged-s3-bucket` wraps several AWS resources behind one small interface.

## 2. Provider Extension

Write or adopt a provider when Terraform needs to manage an API that is not already supported.

Provider plugins translate Terraform resource schemas into API calls:

```text
HCL resource -> provider schema -> create/read/update/delete API calls -> state
```

Use this for first-class API integration. Do not use shell scripts as a substitute for a real provider when lifecycle correctness matters.

## 3. External Data Source

External data sources can bridge small read-only gaps:

```text
Terraform asks script for JSON -> script returns JSON -> Terraform uses values
```

Keep this pattern narrow. It is not a good place for resource creation because Terraform cannot track lifecycle safely.

## 4. Provider Aliases

Provider aliases let the same configuration target multiple accounts, regions, or credentials.

Example use cases:

- create one resource in `us-east-1` and another in `us-west-2`.
- connect a shared networking account to workload accounts.
- separate read-only and write provider identities.

## 5. Policy and Plan Gates

Production Terraform extension also includes workflow controls:

- required plan review.
- cost estimation.
- policy-as-code checks.
- drift detection.
- state locking.
- module version pinning.

## 6. CDK for Terraform Context

CDK for Terraform lets developers write code that generates Terraform configuration. HashiCorp documents CDKTF as deprecated as of 2025-12-10 and no longer supported or maintained, so treat it as legacy or migration context. For new projects, compare HCL modules, AWS CDK, Pulumi, or provider/plugin extension patterns instead.
