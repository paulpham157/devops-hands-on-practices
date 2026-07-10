# OpenStack Service Map

- Keystone: identity, projects, roles, tokens
- Nova: compute scheduling and server lifecycle
- Neutron: networks, subnets, routers, security groups, floating IPs
- Glance: image catalog
- Cinder: block storage volumes and snapshots
- Swift: object storage
- Heat: stack orchestration

A practical tenant workflow is: authenticate in Keystone, select a project, boot an image through Nova, attach networks from Neutron, and mount persistent volumes from Cinder.
