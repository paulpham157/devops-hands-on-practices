# Problem: Choose Plugins for a Team

Open:

```text
plugin-catalog/plugin-selection.md
plugin-catalog/custom-plugin-notes.md
scenario-designs/web-platform.yml
scenario-designs/polyglot-platform.yml
```

For each scenario, answer:

1. Which plugins fit?
2. Are they official Nx plugins, community plugins, or custom internal plugins?
3. What tasks should they help model?
4. What cache inputs, outputs, or task dependencies should they configure?
5. What graph relationships matter?
6. What migration or upgrade support do you need from the plugin?
7. What registry metadata would you check before adopting it?
8. What cache, CI, or maintenance risks remain?

Completion rule: choose plugins by workflow fit, maintenance ownership, and the
specific Nx capabilities they provide instead of popularity. Use registry
metadata such as plugin type, supported Nx version range, update recency, and
maintenance signal as evidence.
