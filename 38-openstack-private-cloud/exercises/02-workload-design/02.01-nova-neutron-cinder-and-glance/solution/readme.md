# Nova, Neutron, Cinder, and Glance

1. `OS::Neutron::SecurityGroup` controls inbound policy.
2. The floating IP plus its association make the VM reachable publicly.
3. An explicit port gives you a concrete attachment point for security groups, fixed IP behavior, and later automation.
