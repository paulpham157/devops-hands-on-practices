# Hiera Data Separation

1. `htop` is only present in production.
2. Data files keep the class reusable and reduce environment-specific branching inside code.
3. Examples: package versions, daemon endpoints, SSH key sets, compliance toggles.
