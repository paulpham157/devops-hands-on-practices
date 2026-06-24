# Promote Artifacts

Promotion means moving a tested artifact through lifecycle stages without rebuilding it.

The important rule is:

```text
build once, test once, promote the same artifact
```

This improves supply-chain integrity because production receives the artifact that passed tests and policy gates.

Promotion can copy artifacts, move artifacts, and set status or properties depending on workflow.

