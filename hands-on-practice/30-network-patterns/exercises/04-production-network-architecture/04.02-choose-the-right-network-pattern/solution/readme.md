# Choose the Right Network Pattern

1. Gateway Aggregation. Tradeoff: gateway fan-out logic and partial failure handling become more complex.
2. Ambassador. Tradeoff: extra helper lifecycle and outbound dependency ownership.
3. Valet Key, often with Static Content Hosting or direct object delivery. Tradeoff: token expiry and scope management become critical.
4. Gatekeeper. Tradeoff: policy ownership and edge validation rules must stay synchronized with backend expectations.

The wrong pattern is usually the one solving the wrong traffic boundary.

