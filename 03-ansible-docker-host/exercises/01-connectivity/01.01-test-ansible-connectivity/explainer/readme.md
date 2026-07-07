# Test Ansible Connectivity

Ansible needs three things before it can configure a host:

- a host address from inventory,
- SSH credentials,
- Python on the target host for most modules.

The `ping` module checks Ansible connectivity. It is not an ICMP ping.
