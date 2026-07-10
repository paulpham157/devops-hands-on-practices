# Exercises: Chef Infra Automation

Work through these exercises after reading the lesson README.

## Exercise Map

1. `01-chef-foundations/01.01-chef-server-workstation-client`
   - Compare the Chef control plane roles and workflow.

2. `01-chef-foundations/01.02-resources-recipes-and-idempotence`
   - Understand how recipes drive idempotent node changes.

3. `02-cookbook-design/02.01-cookbooks-templates-and-attributes`
   - Design reusable cookbooks with templates and attributes.

4. `02-cookbook-design/02.02-policyfiles-and-environments`
   - Use Policyfiles to lock dependencies and promote change.

5. `03-testing-and-release/03.01-test-kitchen-and-chefspec`
   - Design test layers for Chef cookbook delivery.

6. `03-testing-and-release/03.02-infra-client-scheduling-and-drift`
   - Reason about chef-client cadence and drift correction.

7. `04-adoption-and-tradeoffs/04.01-compare-chef-and-ansible`
   - Compare cookbook-based automation with task-oriented Ansible.

8. `04-adoption-and-tradeoffs/04.02-design-a-chef-governance-model`
   - Define ownership and promotion rules for shared cookbooks.

## Suggested Workflow

From the lesson directory:

```bash
./scripts/validate.sh
```

Then inspect:

```text
cookbooks/
policyfiles/
scenario-designs/
```
