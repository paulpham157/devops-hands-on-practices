# Adopt Puppet Enterprise Controls

1. The 500 long-lived audited service VMs justify Puppet most strongly.
2. The ephemeral CI runners and frequently replaced Kubernetes workers should not be the center of the Puppet strategy.
3. Audit trails for code promotion, classification, and drift reporting strengthen the case.
