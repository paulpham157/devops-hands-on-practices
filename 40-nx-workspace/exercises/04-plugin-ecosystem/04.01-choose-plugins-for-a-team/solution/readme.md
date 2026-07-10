# Solution: Choose Plugins for a Team

For the web platform scenario, useful official plugins include `@nx/react`,
`@nx/vite`, `@nx/playwright`, and `@nx/storybook`. They help model app builds,
library builds, e2e tests, and component documentation.

The plugins should infer or configure build, test, e2e, and Storybook tasks.
They should define safe cache inputs and outputs from the relevant tool config
instead of leaving every target as an uncached shell command.

For the polyglot scenario, useful plugins include `@nx/js`, `@nx/node`,
`@nx/gradle`, and `@nx/docker`. They help model mixed-language builds, service
tasks, and container outputs.

For cloud or platform plugins, search the registry before choosing. An `aws`
search can return AWS CDK-focused community plugins and `@aws/nx-plugin`.
Compare supported Nx versions, update recency, maintenance status, and whether
the plugin solves the team's actual workflow.

Use an internal plugin only if the team has repeated organization-specific
service templates, graph rules, or platform commands that official and
well-maintained community plugins do not cover.

The first internal plugin should usually be a generator that wraps official
generators with approved defaults, tags projects, places files in the expected
folders, and updates config. Reach for executors or graph plugins only when the
team has custom task execution or dependency discovery needs.

Migration support matters when generated project layouts, framework configs, or
tool versions change. A plugin that cannot help with upgrades may still be
useful, but the team must own those migrations manually.

Remaining risks include missing graph edges, unsafe cache inputs, broad affected
sets, unclear ownership across ecosystems, stale community plugins, and custom
plugins without tests or release ownership.
