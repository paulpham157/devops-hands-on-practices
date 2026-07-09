# Solution: Understand Inferred Tasks

An inferred task is a task discovered by an Nx plugin from existing tool configuration.

It reduces `project.json` boilerplate because the plugin can infer targets, cache settings, and dependencies from files the tool already uses.

Likely plugin families include build tools, test tools, frontend frameworks, and language ecosystem integrations.

After adding a plugin, inspect projects, targets, graph changes, cache behavior, and generated configuration.
