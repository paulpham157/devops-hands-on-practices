# Resources, Recipes, and Idempotence

Chef recipes execute resources in order, but the resources themselves should still converge idempotently.

Inspect the sample recipes under `cookbooks/` and note:

- package resources
- service enable/start behavior
- templated daemon config
