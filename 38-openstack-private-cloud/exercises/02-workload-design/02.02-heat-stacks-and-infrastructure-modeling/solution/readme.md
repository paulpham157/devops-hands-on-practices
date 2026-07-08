# Heat Stacks and Infrastructure Modeling

1. `heat/network-stack.yml` owns the router and subnet wiring.
2. `heat/instance-stack.yml` owns the server and floating IP path.
3. Outputs give operators stable values such as instance name or public IP for later scripts, dashboards, or handoff notes.
