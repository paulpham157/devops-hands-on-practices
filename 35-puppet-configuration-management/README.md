# Lesson 35: Puppet Configuration Management

## Goal

Learn how Puppet models infrastructure as declarative configuration and how teams use catalogs, classes, roles, profiles, and Hiera data to manage server fleets.

This lesson teaches:

- Puppet Server and agent workflows, plus where Puppet Bolt fits for agentless tasks.
- resources, manifests, catalogs, and idempotent convergence.
- modules, classes, roles, and profiles.
- Hiera data separation, Puppetfile-managed modules, and Code Manager-style promotion.
- drift detection, reporting, and compliance workflows.
- where Puppet fits compared with Ansible and image-based provisioning.

No Puppet server is required for the core exercises. The lesson is designed as an offline-first modeling and review lab.

## Navigation

- Previous lesson: `34-data-pipeline`
- Next lesson: `36-chef-infra-automation`

## Related Lessons

- `03-ansible-docker-host`
- `04-packer-docker-image`
- `36-chef-infra-automation`

## Prerequisites and Entry Check

- Completion of `03-ansible-docker-host` and `04-packer-docker-image`, or equivalent configuration/image lifecycle experience.
- No Puppet server is required for the offline-first exercises.

Entry check: explain desired state, idempotent convergence, drift, and the role/profile boundary before reading the examples.

## Mental Model

```text
source control -> Puppet code and Hiera data -> catalog compilation -> agent run -> desired state on nodes
```

Puppet is strongest when a platform team wants a long-lived desired-state contract for many servers with structured role modeling and auditability.

## Lab Layout

```text
modules/             Example role and profile modules
manifests/           Node classification examples
data/                Hiera data for common and per-environment values
plans/               Bolt plan example for agentless remediation
tasks/               Bolt task example
scenario-designs/    Team and fleet decision scenarios
scripts/             Validation helper
exercises/           Structured hands-on practice
```

## Core Concepts

| Concept | Purpose | Example |
| --- | --- | --- |
| Resource | Declare desired state for a system object | `package { 'docker.io': ensure => installed }` |
| Class | Group related resources | `class profile::base` |
| Module | Package classes, templates, files, and facts | `modules/profile` |
| Catalog | Compiled desired state for a node | resources ordered for one agent run |
| Hiera | External data lookup | environment-specific package list |
| Role and profile | Separate business intent from implementation | `role::docker_host` includes `profile::base` |

## Role and Profile Pattern

A practical Puppet design usually separates concerns like this:

- component modules manage one technology or concern.
- profile classes combine components into reusable building blocks.
- role classes describe what a node is for.
- Hiera stores data that varies by environment or node group.

This keeps classification readable while avoiding copy-paste across many node definitions.

## Hiera and Environments

Hiera lets teams move values out of manifests. Common uses include:

- package versions
- allowed users and SSH keys
- daemon configuration values
- environment-specific endpoints
- compliance settings

Environment promotion often means the same Puppet code is applied across `dev`, `staging`, and `production` with controlled data changes and branch promotion. In modern Puppet Enterprise setups, Code Manager is the more current default deployment path; `r10k` still matters historically and in some installations, but should not be the first mental model for a new team.

## Agentless Operations with Bolt

Puppet Bolt gives the platform a native agentless path for:

- one-off tasks
- orchestrated remediation plans
- bridging legacy nodes before full Puppet rollout

That matters when the team wants Puppet-style modeling for the steady state but still needs ad hoc or staged execution on nodes that do not run the agent yet.

## Production Questions

Before adopting Puppet, answer:

1. Is the fleet long-lived enough to benefit from continuous convergence?
2. Will the team accept an agent-based model and periodic runs?
3. How will roles, profiles, and Hiera data be owned?
4. Which drift should be auto-corrected versus only reported?
5. How will secrets be managed outside plain Hiera data?

## Validate

From this lesson directory:

```bash
./scripts/validate.sh
```

This checks required files, shell syntax, YAML syntax, and exercise coverage.

Optional local inspection commands:

```bash
puppet parser validate manifests/site.pp modules/profile/manifests/base.pp modules/role/manifests/docker_host.pp
bolt task show healthcheck --modulepath ./modules
```

## Exercises

Start here:

```text
exercises/README.md
```

The exercises cover Puppet architecture, catalogs, role modeling, Hiera data, Code Manager and Puppetfile promotion, Bolt usage, compliance, and adoption tradeoffs.

## Cleanup

The core lesson is offline-first and creates no required server resources. Remove only generated parser output or disposable local files created by an exercise.

## References

- Puppet documentation: https://help.puppet.com/
- Puppet language overview: https://help.puppet.com/core/current/Content/PuppetCore/lang_visual_index.htm
- Hiera documentation: https://help.puppet.com/core/current/Content/PuppetCore/hiera_intro.htm
- Bolt documentation: https://help.puppet.com/bolt/current/topics/bolt.htm
- Code Manager documentation: https://help.puppet.com/pe/current/topics/code_mgr_enable.htm
- Roles and profiles method: https://www.puppet.com/docs/puppet/latest/the_roles_and_profiles_method.html
