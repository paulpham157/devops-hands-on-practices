# DevOps Hands-on Practices

This repository is a versioned DevOps learning product made of lessons, exercises, and validation paths. The glossary here captures the course-specific terms used to describe how the curriculum is packaged and presented to learners.

## Contributor Context

Use this file when adding, editing, validating, reviewing, or releasing lesson content. Learners should use `README.md`, `LEARNING_PATHS.md`, and the selected lesson README instead.

### Contributor Workflow

1. Read the target lesson README, exercises, and local scripts before changing content.
2. Keep lesson content, examples, exercises, and validation logic self-contained and aligned.
3. Put tool prerequisites, installation steps, setup, commands, and cleanup in the lesson README.
4. Prefer local-first and offline-first exercises when cloud accounts or paid services are optional.
5. Keep `explainer`, `problem`, and `solution` materials aligned when a lesson uses that structure.

### Contributor Validation

Run the checks that match the scope of the change:

```bash
cd <lesson-folder>
./scripts/validate.sh
```

For broad changes, also run:

```bash
./scripts/validate-all.sh
find . -path '*/scripts/*.sh' -exec sh -n {} \;
git diff --check
```

Do not commit credentials, `.env` files, kubeconfigs, Terraform state, generated scanner reports, or real secret values. Use example files and placeholders.

### Authoring Conventions

- Use direct, runnable Markdown and prefer ASCII text.
- Use `docker compose` instead of legacy `docker-compose`.
- Use Grafana Alloy for new Loki collection examples; keep Promtail only as legacy context.
- Treat CDKTF as deprecated context, not a recommended new IaC path.
- Refer to Google Cloud Functions 2nd gen as Cloud Run functions where relevant.
- Pin CI runner images or document the update policy for production examples.

## Curriculum Redesign Plan

### Redesign Goal

Evolve this repository from a broad tool-oriented curriculum into a competency-based learning product that can take a learner from foundations through junior and mid-level practice, then assess production ownership through a shared senior-level core. DevOps, platform engineering, and SRE remain specialization overlays on that core rather than three separate curricula.

The redesign must preserve the existing local-first lesson library. It should deepen the curriculum through realistic system ownership, tradeoff analysis, failure handling, and cross-lesson projects instead of adding tools only to make the topic list longer.

### Design Principles

1. Organize learning outcomes around capabilities, not product names.
2. Keep numbered lessons as reusable learning modules; compose them into level-based and role-based paths.
3. Separate learning a concept, practicing a skill, and proving production judgment.
4. Make every level end with observable evidence that can be reviewed consistently.
5. Introduce production constraints such as reliability, security, cost, scale, migration, and team ownership gradually.
6. Prefer one coherent reference system across advanced exercises so learners can see how decisions interact.
7. Keep cloud accounts optional for core learning; use design artifacts, local simulations, and example data when a real platform would create cost or access barriers.
8. Do not equate course completion with job seniority. Senior readiness requires prior operating experience plus successful assessment of production scenarios.

### Target Curriculum Architecture

The redesigned product should have four layers:

| Layer | Purpose | Primary evidence |
| --- | --- | --- |
| Foundations | Build Linux, networking, container, source control, and automation mental models | Runnable labs and concept checks |
| Delivery Practitioner | Build and operate a delivery path using IaC, CI/CD, Kubernetes, secrets, and observability | Integrated deployment project |
| Production Owner | Diagnose failures and make reliability, security, cost, scaling, and migration decisions | Scenario labs, game days, and operational artifacts |
| Senior Capstone | Own a system across architecture, delivery, incidents, governance, and improvement | Reviewed portfolio and defense |

Role-oriented paths such as CI/CD, IaC, DevSecOps, platform engineering, SRE, cloud, and data should remain available, but each path must declare its expected entry level, shared production-ownership core, optional specialization overlay, and completion evidence. The first redesign milestone should assess the shared core consistently before adding role-specific capstone variants.

### Competency Framework

Create a curriculum-wide competency matrix covering at least:

- Linux and systems troubleshooting
- networking and application protocols
- containers and Kubernetes operations
- infrastructure as code and configuration management
- CI/CD, GitOps, release, and artifact lifecycle
- cloud architecture and identity
- security, policy, compliance, and software supply chain
- observability and production debugging
- reliability engineering and incident management
- data durability, backup, restore, and disaster recovery
- performance, capacity planning, and scalability
- FinOps and cost-aware architecture
- platform engineering and developer experience
- architecture communication, ADRs, RFCs, and tradeoff analysis
- technical leadership, mentoring, stakeholder communication, and toil reduction

For every competency, define:

1. the lessons that introduce and practice it;
2. expected behavior at foundation, practitioner, production-owner, and senior-capstone levels;
3. the artifact or observed action used as evidence;
4. prerequisites and dependencies;
5. known curriculum gaps.

### Content Workstreams

#### 1. Audit and Map Existing Lessons

- Inventory every lesson goal, prerequisite, exercise, validation path, production note, and cleanup step.
- Map existing material into the competency framework.
- Identify duplicated tool comparisons, missing prerequisites, shallow exercises, and lessons that combine too many outcomes.
- Mark each lesson as foundation, practitioner, production-owner, specialization, or reference material.
- Decide whether each lesson should be retained, merged, split, rewritten, or deprecated. Keep stable folder numbers until redirects and learning paths are ready.

Deliverables:

- `docs/curriculum/competency-matrix.md`
- `docs/curriculum/lesson-inventory.md`
- an ADR under `docs/adr/` for any lesson merge, split, renumbering, or deprecation

#### 2. Rebuild Learning Paths Around Demonstrable Levels

- Add a canonical foundation-to-production progression alongside the goal-oriented paths.
- Define entry checks so experienced learners can skip material they can already demonstrate.
- Add prerequisite and dependency information to every path.
- Replace topic-only completion targets with portfolio evidence and assessment criteria.
- Show shared core lessons separately from role specialization.

Deliverables:

- revised `LEARNING_PATHS.md`
- level definitions and entry/exit criteria
- path diagrams or tables showing dependencies and crossover points

#### 3. Standardize Lesson Design

Adopt a common lesson contract:

1. goal and production relevance;
2. prerequisites and entry check;
3. mental model;
4. guided local-first lab;
5. independent exercise;
6. failure or troubleshooting scenario;
7. production tradeoffs;
8. validation and evidence to retain;
9. cleanup;
10. recap, quiz, and next lesson.

The lesson validator should check required structure and internal links without forcing every lesson to use identical technology or lab mechanics.

Deliverables:

- lesson authoring template
- exercise and assessment rubric templates
- curriculum structure linter or validation script

#### 4. Add Production Ownership Modules

Add or substantially deepen material in these areas:

- incident command, on-call, escalation, runbooks, blameless postmortems, and follow-up ownership;
- load testing, bottleneck analysis, capacity models, autoscaling, quotas, and right-sizing;
- cloud cost allocation, forecasting, unit economics, budgets, and cost guardrails;
- backup verification, restore drills, RPO, RTO, regional failure, and disaster recovery exercises;
- Kubernetes upgrades, node and control-plane failure, multi-tenancy, policy, and recovery;
- Terraform/OpenTofu remote state, imports, drift, state recovery, module lifecycle, and multi-environment workflows;
- landing zones, account or subscription structure, identity federation, and network topology;
- policy as code, audit evidence, exception handling, and compliance-aware delivery;
- zero-downtime releases, schema migration, compatibility, canary analysis, and rollback;
- platform APIs, golden paths, self-service, developer experience, and platform success metrics.

Each module should include failure injection or an incomplete production situation, not only a happy-path setup.

#### 5. Build an Integrated Reference System

Create one small but realistic reference system reused across advanced lessons. It should include multiple services, persistent data, asynchronous work, authentication, observability, deployment automation, and declared service objectives.

Maintain scenario overlays rather than copying the whole system for every lesson. Example overlays can introduce traffic growth, dependency failure, leaked credentials, a bad release, state drift, data loss, or a cost regression.

The reference system must remain runnable locally in a reduced form and provide design-only alternatives for cloud-specific scenarios.

#### 6. Create Production Game Days

Add time-boxed scenarios in which the learner must:

- observe symptoms before seeing the cause;
- form and test hypotheses;
- mitigate customer impact;
- communicate status and tradeoffs;
- recover or roll back safely;
- preserve an incident timeline;
- write a postmortem and prioritize follow-up work.

Assess the investigation and decision process, not only whether the final service returns HTTP 200.

#### 7. Add a Senior Production Capstone

The capstone should give the learner a system brief with traffic, SLOs, security requirements, budget limits, team constraints, and incomplete architecture. The learner must produce and defend:

- architecture diagrams and ADRs;
- a threat model and identity boundaries;
- infrastructure and delivery design;
- observability, alerting, and SLO definitions;
- capacity and cost estimates;
- backup, restore, and disaster recovery plans;
- a migration and rollback strategy;
- runbooks and an incident response plan;
- evidence from a game day;
- a postmortem and prioritized improvement roadmap.

The final assessment should use a published rubric and include a live or written design defense. Passing the capstone demonstrates curriculum-level production judgment; it must not claim that the learner has gained the workplace experience required for a senior job title.

#### 8. Improve Assessment and Review

- Add diagnostic entry assessments and level exit assessments.
- Distinguish knowledge checks, guided practice, independent implementation, troubleshooting, and design judgment.
- Require evidence such as command output, dashboards, plans, diffs, timelines, ADRs, and postmortems.
- Create rubrics with observable criteria for correctness, safety, reasoning, operability, and communication.
- Provide reviewer guidance that identifies gaps without reducing open-ended production problems to one canonical answer.
- Do not surface solution notes in the default learner flow before an attempt. Because this is a public repository, use navigation and learner guidance rather than claiming that solutions are technically inaccessible.

#### 9. Update Navigation and Contributor Tooling

- Keep the root `README.md` concise and learner-facing.
- Use `LEARNING_PATHS.md` as the main path selector.
- Put detailed curriculum architecture, matrices, rubrics, templates, and migration records under `docs/curriculum/`.
- Keep architecture decisions under `docs/adr/`; curriculum documents may link to them but should not create a second ADR location.
- Update the repository-local learner and review skills when lesson contracts or assessment evidence change.
- Extend root validation to catch broken paths, missing lesson sections, stale prerequisites, unsafe example secrets, and unpaired problem/solution materials.

### Delivery Phases

#### Phase 0: Baseline and Decisions

- Freeze a baseline inventory of the current curriculum.
- Define learner personas, level boundaries, and the competency vocabulary.
- Record architecture decisions for folder stability, the reference system, assessment policy, and deprecation policy.
- Create a workstream register that assigns a maintainer or maintainer team, dependencies, rough size, deliverable, and acceptance check to each redesign workstream. Here, an owner means the maintainer accountable for coordinating and accepting that curriculum work, not the author of every lesson change.

Exit criteria: maintainers agree on the competency matrix structure, target levels, and evidence model.

#### Phase 1: Curriculum Map and Quick Structural Fixes

- Complete the lesson inventory and initial competency mapping.
- Correct missing prerequisites, cleanup steps, navigation, and lesson goals.
- Introduce templates and automated structural validation.

Exit criteria: every current lesson has an owner, level, competency mapping, and disposition decision.

#### Phase 2: Practitioner Integration

- Build the integrated reference system.
- Add a cross-lesson delivery project covering source-to-production flow.
- Revise junior and role-oriented paths to end in evidence-based assessments.

Exit criteria: a learner can complete a coherent practitioner project without stitching unrelated sample applications together.

#### Phase 3: Production Ownership

- Add incident, performance, cost, recovery, migration, policy, and platform modules.
- Add failure scenarios and game days to the reference system.
- Publish production-owner rubrics and reviewer guidance.

Exit criteria: the course tests diagnosis, mitigation, recovery, and tradeoffs across multiple operational constraints.

#### Phase 4: Senior Capstone and Pilot

- Implement the capstone brief, artifacts, game day, rubric, and defense process.
- Pilot it with learners who have different experience levels.
- Calibrate scope and scoring from observed completion evidence and reviewer disagreement.

Exit criteria: the capstone can be reviewed consistently and exposes gaps in production judgment instead of rewarding tool memorization.

#### Phase 5: Migration and Stable Release

- Update learner navigation and contributor documentation.
- Mark replaced content clearly and preserve redirects or migration notes.
- Publish a legacy-to-new lesson and path mapping with resume guidance for learners already in progress.
- Run full repository validation and a complete learner-path walkthrough.
- Publish the redesign as a significant curriculum milestone using the editorial release workflow.

Exit criteria: existing learners can understand what changed, resume from an appropriate point, and trust the stable release path.

### Redesign Success Measures

Track outcomes that reveal learning quality rather than repository size:

- percentage of competencies with independent, reviewable evidence;
- percentage of paths ending in an integrated assessment;
- learner success rate on unseen troubleshooting scenarios;
- restore, mitigation, and diagnosis quality during game days;
- rubric agreement between independent reviewers;
- number of prerequisite or navigation failures found during learner walkthroughs;
- learner ability to explain tradeoffs and rejected alternatives;
- time required to update lessons safely when a tool or platform changes.

Do not use lesson count, tool count, or repository size as primary success measures.

### Immediate Next Actions

1. Create the competency-matrix template and agree on the four proficiency levels.
2. Inventory lessons `00` through `40` against that matrix without rewriting them yet.
3. Select the smallest viable reference system and record the decision in an ADR.
4. Prototype one production game day using existing observability, availability, and SLO lessons.
5. Use the prototype to calibrate the lesson contract and assessment rubric before redesigning the remaining lessons.

## Language

**Learning Product Version**:
A named curriculum version that represents a stable state of the course for learners to consume. It refers to the course as a learning product, not to an installable software package.
_Avoid_: Release package, npm package, raw snapshot

**Significant Curriculum Milestone**:
A course change substantial enough to justify a new learning product version. It includes adding meaningful new lesson coverage, changing learning paths or curriculum structure, or making broad content fixes that should move learners to the newer version.
_Avoid_: Routine merge, minor doc fix, typo-only change

**Manual Release Trigger**:
A deliberate maintainer action that starts creation of a new learning product version after a significant curriculum milestone is judged ready. It is not tied to every merge on the default branch.
_Avoid_: Auto-release on merge, continuous release

**Curated Release Notes**:
Release notes written manually for learners in curriculum language. They summarize meaningful course changes instead of exposing raw commit history or maintainer-oriented change labels.
_Avoid_: Raw commit log, auto-generated maintainer notes

**Editorial Release Workflow**:
A maintainer-driven release process that publishes a learning product version only when a significant curriculum milestone is ready. It favors manual version selection and curated learner-facing notes over continuous automated software release.
_Avoid_: Semantic-release default flow, continuous automated release

**Manual Version Selection**:
The maintainer chooses the learning product version number at release time. The version reflects editorial curriculum impact, not an automatically inferred software change level.
_Avoid_: Auto-bumped version, commit-derived version

**Release Changelog Entry**:
A manually written learner-facing summary for one learning product version that is added to `CHANGELOG.md` and reused for the GitHub Release. It is part of the release record, not a separate optional note.
_Avoid_: Uncommitted notes, auto-generated commit summary

**Stable Release Branch**:
The `main` branch that represents the learner-trusted stable state of the curriculum and is the only branch allowed to produce a learning product version.
_Avoid_: Develop release branch, release from any branch

**Default Release Artifact**:
The standard GitHub source archive attached to a tagged release, used without any custom course bundle. It is sufficient because the repository and README remain the primary learner entry point.
_Avoid_: Custom release zip, packaged installer

**Release Promotion Boundary**:
Promotion of content into `main` happens before release and through the normal branch workflow. The release workflow assumes `main` is already stable and does not promote changes across branches by itself.
_Avoid_: Release-driven promotion, branch-sync release job

**Draft Release Review**:
A draft GitHub Release created by the editorial release workflow for maintainer review before public publication. It allows the release record to be checked without immediately announcing the new learning product version to learners.
_Avoid_: Immediate public release, no-review release publish

**Versioned Release Notes File**:
A learner-facing release notes document stored in the repository for one specific learning product version, using a path such as `docs/releases/v1.2.0.md`. The editorial release workflow reads this file instead of collecting long-form notes from GitHub Actions inputs.
_Avoid_: Pasted workflow notes, ad hoc release text

**Release Record File**:
A versioned release notes file that remains in the repository after publication as part of the permanent learning product history. It is not a temporary staging artifact.
_Avoid_: Disposable release draft, deleted notes file

**Release Record Commit**:
A commit created by the release workflow on `main` that records learner-facing release metadata such as the new `CHANGELOG.md` entry. The version tag is created from this commit so the repository history and release record stay aligned.
_Avoid_: Out-of-band changelog edit, tag without release metadata commit
