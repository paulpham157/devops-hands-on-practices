# Solution: Design Secure Network Baseline

Public subnets should contain public load balancers or public ingress components.

Private subnets should contain app instances, Kubernetes nodes if private, and databases.

Private app traffic can reach the internet through NAT or provider-specific egress controls.

The database should allow traffic only from the app security group, network security group, or equivalent workload identity/network boundary.

Enable audit logs, load balancer logs, firewall or flow logs, and application logs.

