# Secrets, Parameters, and Approvals

Inspect the secure parameter usage in `settings.kts` and the release discussion in `pull-request-flow.md`.

Then answer:

1. Why should Docker credentials be modeled as a secure parameter instead of plain text in the script?
2. Which stage is the better place for a manual approval: unit tests or release publish?
3. What is one risk of giving every agent access to every secret?
