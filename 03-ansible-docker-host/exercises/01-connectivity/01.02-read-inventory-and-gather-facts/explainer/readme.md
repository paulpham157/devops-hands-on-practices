# Read Inventory and Gather Facts

Ansible needs inventory data before it can automate a host.

Inventory tells Ansible where the host is and which connection variables to use. Facts tell Ansible what the host looks like after connection succeeds.

Both are useful when a playbook works on one machine and fails on another.
