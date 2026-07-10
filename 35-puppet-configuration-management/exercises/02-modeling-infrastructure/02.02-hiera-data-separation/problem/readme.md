# Hiera Data Separation

Compare `data/common.yaml` and `data/environments/production.yaml`.

Then answer:

1. Which package is only present in production?
2. Why is it better to place that difference in data rather than hard-code an `if production` branch in the class?
3. Name two other values that belong in Hiera instead of the manifest.
