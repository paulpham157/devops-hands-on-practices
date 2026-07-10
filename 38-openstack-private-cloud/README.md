# Lesson 38: OpenStack Private Cloud

## Goal

Learn how OpenStack provides an open private cloud control plane for compute, networking, storage, identity, and infrastructure orchestration.

This lesson teaches:

- core OpenStack services such as Keystone, Nova, Neutron, Cinder, Glance, and Heat.
- projects, quotas, domains, and private cloud governance. Older docs and teams may still say tenants.
- instance, image, block storage, and virtual network design.
- security groups, identity domains, and secrets considerations.
- failure domains, upgrades, and operations tradeoffs.
- where OpenStack fits compared with public cloud and Kubernetes-first platforms.

No OpenStack cluster is required for the core exercises. The lesson is offline-first and emphasizes architecture and operations reasoning.

## Navigation

- Previous lesson: `37-teamcity-ci-pipelines`
- Next lesson: `39-aws-nx-plugin`

## Related Lessons

- `21-aws-azure-gcp-cloud-fundamentals`
- `23-iac-cdk-cloudformation-pulumi-terraform`
- `25-openshift-gke-eks-aks-ecs-fargate`

## Mental Model

```text
api and identity -> image, network, and storage services -> instance scheduling -> tenant workloads -> operations and quotas
```

OpenStack is most relevant when an organization wants cloud-like APIs and multi-tenant control over infrastructure it operates itself.

## Lab Layout

```text
platform-maps/       Service maps and operations checklists
heat/                Heat orchestration examples with network, port, and floating IP resources
scenario-designs/    Private cloud and edge scenarios
scripts/             Validation helper
exercises/           Structured hands-on practice
```

## Core Service Map

| Need | OpenStack Service | Purpose |
| --- | --- | --- |
| Identity and auth | Keystone | projects, users, roles, tokens |
| Virtual machines | Nova | compute scheduling and lifecycle |
| Images | Glance | image catalog and distribution |
| Networks | Neutron | tenant networks, routers, floating IPs |
| Block storage | Cinder | persistent volumes |
| Object storage | Swift | object storage service |
| Orchestration | Heat | stack-based infrastructure modeling |

## Platform Positioning

OpenStack is not a public cloud provider. It is a framework for building a cloud platform that an organization runs. That means teams gain control over:

- hardware and region placement
- tenant and quota design
- network topology and integration
- upgrade timing
- compliance boundaries

But they also inherit significant operational responsibility.

## Practical Workload Modeling

For realistic OpenStack modeling, do not stop at a single server resource. A useful lesson should reason about:

- Neutron networks and explicit ports
- security groups
- floating IP association
- image and flavor selection
- stack outputs consumed by operators or later automation

## Production Questions

Before choosing OpenStack, answer:

1. Why is a self-operated private cloud required?
2. Which teams will own lifecycle operations and upgrades?
3. How many tenants, networks, and quota boundaries are needed?
4. Is VM-based infrastructure the main contract, or is Kubernetes the real product?
5. Which workloads cannot live in public cloud because of latency, sovereignty, or connectivity?

## Validate

From this lesson directory:

```bash
./scripts/validate.sh
```

This checks required files, shell syntax, YAML syntax, and exercise coverage.

Optional local inspection commands:

```bash
sed -n '1,220p' heat/network-stack.yml
sed -n '1,220p' heat/instance-stack.yml
```

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover OpenStack services, tenant design, Heat stacks, security, operations, and private-cloud tradeoffs.

## References

- OpenStack documentation: https://docs.openstack.org/
- OpenStack architecture design guide: https://docs.openstack.org/arch-design/
- Keystone documentation: https://docs.openstack.org/keystone/latest/
- Heat documentation: https://docs.openstack.org/heat/latest/
