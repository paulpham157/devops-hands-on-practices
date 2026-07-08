# Exercises: OpenStack Private Cloud

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-openstack-foundations/01.01-core-services-and-control-plane`
   - Map core OpenStack services to platform responsibilities.

2. `01-openstack-foundations/01.02-projects-networks-and-quotas`
   - Design tenant boundaries and quota models.

3. `02-workload-design/02.01-nova-neutron-cinder-and-glance`
   - Model a VM workload using core infrastructure services.

4. `02-workload-design/02.02-heat-stacks-and-infrastructure-modeling`
   - Read Heat templates as stack-based infrastructure code.

5. `03-operations-and-security/03.01-identity-security-groups-and-secrets`
   - Compare identity, network isolation, and secret handling options.

6. `03-operations-and-security/03.02-monitoring-upgrades-and-failure-domains`
   - Reason about day-two operations and platform upgrades.

7. `04-platform-positioning/04.01-compare-openstack-and-public-cloud`
   - Compare private-cloud control with public-cloud managed services.

8. `04-platform-positioning/04.02-choose-openstack-for-private-cloud-needs`
   - Decide when OpenStack is justified for sovereignty or edge constraints.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
```

Then inspect:

```text
platform-maps/
heat/
scenario-designs/
```
