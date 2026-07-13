# Lesson 36: Chef Infra Automation

## Goal

Learn how Chef Infra models infrastructure with cookbooks, recipes, resources, Policyfiles, and test-driven infrastructure workflows.

This lesson teaches:

- Chef Infra Server, Workstation, and Client roles.
- resources, recipes, cookbooks, templates, and attributes.
- Policyfiles, lockfiles, and release promotion.
- local testing with Chef Workstation, ChefSpec, InSpec, and Test Kitchen.
- scheduled convergence, drift handling, and governance.
- where Chef fits compared with Ansible and Puppet.

No Chef server is required for the core exercises. The lesson is offline-first and focuses on modeling and operational tradeoffs.

## Navigation

- Previous lesson: `35-puppet-configuration-management`
- Next lesson: `37-teamcity-ci-pipelines`

## Related Lessons

- `03-ansible-docker-host`
- `11-devsecops-container-pipeline`
- `35-puppet-configuration-management`

## Prerequisites and Entry Check

- Completion of `03-ansible-docker-host` and `35-puppet-configuration-management`, or equivalent configuration-management experience.
- No Chef server is required for the offline-first exercises.

Entry check: explain how a Policyfile lock, cookbook test, and convergence run provide different evidence.

## Mental Model

```text
source control -> cookbook and policy code -> policy resolution -> chef-client run -> desired state on nodes
```

Chef is useful when infrastructure should be modeled as reusable code artifacts with strong cookbook structure and automated test workflows.

## Lab Layout

```text
cookbooks/           Example recipes, attributes, templates, and metadata
policyfiles/         Policyfile-based environment control
test/                InSpec verification controls
scenario-designs/    Adoption and operations scenarios
scripts/             Validation helper
exercises/           Structured hands-on practice
```

## Core Concepts

| Concept | Purpose | Example |
| --- | --- | --- |
| Resource | Declare desired state | `package 'docker.io'` |
| Recipe | Ordered resource execution | `recipes/default.rb` |
| Cookbook | Package recipes, templates, files, attributes, and tests | `cookbooks/docker_host` |
| Attribute | Configurable value for recipes and templates | `node['docker']['log-driver']` |
| Policyfile | Lock cookbook set and run list | `Policyfile.rb` |
| chef-client | Applies desired state on the node | scheduled or manual run |

## Policyfile Thinking

Policyfiles let teams define:

- cookbook sources
- run list
- locked dependency graph
- promotion between environments

That reduces environment drift caused by changing dependency resolution at deploy time. In practice, teams usually commit `Policyfile.lock.json` and test converges from Chef Workstation before promoting the same lock to the next environment.

## Testing Approach

Chef is often adopted with layered testing:

- lint cookbook structure and style.
- run unit-level checks with ChefSpec.
- use Test Kitchen for convergence tests.
- verify node state with InSpec.

Even when the live lab is offline-first, teams should still design for testable infrastructure code.

## Practical Local Workflow

A realistic modern workflow usually looks like:

1. Generate or update cookbooks from Chef Workstation.
2. Edit recipes, templates, and attributes.
3. Resolve and commit a `Policyfile.lock.json`.
4. Run `kitchen converge` and `kitchen verify`.
5. Promote the same locked policy to the next environment.

## Production Questions

Before adopting Chef, answer:

1. Does the team want cookbook and Policyfile workflows over playbook-style tasks?
2. Who owns shared cookbooks and review gates?
3. How will secrets, attributes, and environment data be separated?
4. Which tests run before cookbook promotion?
5. Is scheduled client convergence acceptable for the fleet?

## Validate

From this lesson directory:

```bash
./scripts/validate.sh
```

This checks required files, shell syntax, YAML syntax, and exercise coverage.

Optional local workflow commands:

```bash
chef install policyfiles/Policyfile.rb
kitchen test
chef-client --local-mode --runlist 'base::default,docker_host::default'
```

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover Chef architecture, cookbook design, Policyfiles, local test workflows, drift handling, and adoption tradeoffs.

## Cleanup

The core exercises are offline-first. Remove only generated Kitchen/Test output or local policy artifacts created during the exercise; do not delete managed host resources as cleanup.

## References

- Chef documentation: https://docs.chef.io/
- Chef Infra resources: https://docs.chef.io/resources/
- Policyfiles: https://docs.chef.io/policyfile/
- Chef Workstation: https://docs.chef.io/workstation/
- Test Kitchen: https://docs.chef.io/workstation/test_kitchen/
