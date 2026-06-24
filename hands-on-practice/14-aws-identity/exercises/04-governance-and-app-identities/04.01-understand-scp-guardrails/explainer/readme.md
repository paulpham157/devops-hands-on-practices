# Explainer: Understand SCP Guardrails

Service Control Policies are AWS Organizations guardrails.

An SCP does not grant permissions by itself.

It defines the maximum permissions available to accounts or organizational units.

If an SCP denies an action, the action is denied even if an IAM policy allows it.

Use SCPs for broad governance boundaries, such as denying organization exit, restricting regions, or blocking risky account-level operations.
