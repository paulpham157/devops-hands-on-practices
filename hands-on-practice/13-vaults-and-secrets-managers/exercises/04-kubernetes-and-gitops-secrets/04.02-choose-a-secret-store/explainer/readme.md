# Explainer: Choose a Secret Store

Choosing a secret store is an architecture decision.

Ask:

- Where does the workload run?
- Which identity system already exists?
- Do credentials need rotation?
- Do credentials need to be dynamic and short-lived?
- Who needs audit visibility?
- Does GitOps need encrypted desired state?
- What happens during an incident?

The simplest secure option is usually better than a powerful system no one can operate well.
