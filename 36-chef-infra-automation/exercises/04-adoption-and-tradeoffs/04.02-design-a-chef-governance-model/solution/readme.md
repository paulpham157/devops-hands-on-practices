# Chef Governance Model

A reasonable model is:

1. The platform engineering team owns the shared base cookbook, with service-team review for breaking changes.
2. Syntax, unit checks, Kitchen converge, and InSpec verification should pass before lock updates.
3. Package version changes, service restart behavior, and security-hardening changes should require staging verification.
