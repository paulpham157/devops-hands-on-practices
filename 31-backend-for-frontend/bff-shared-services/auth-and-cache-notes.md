# Auth and Cache Notes

BFF often owns client-edge behavior such as:

- session or token adaptation for one client type
- caching of safe, read-heavy aggregated data
- normalization of downstream errors into stable client contracts

It should not become the permanent home of core business policy.

