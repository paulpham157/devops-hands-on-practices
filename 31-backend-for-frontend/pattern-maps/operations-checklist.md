# Operations Checklist

Use this checklist before creating or changing a BFF.

## Boundary

- Is the logic client-specific or generic platform logic?
- Does the BFF own presentation shaping without owning business rules?
- Can the BFF be mapped clearly to one client or one client family?

## Performance

- Does aggregation reduce client round trips enough to justify the extra hop?
- Can the BFF cache safe data near the client boundary?
- Is payload trimming important for the client experience?

## Ownership

- Which team deploys the BFF?
- Which team responds to BFF incidents?
- Are domain services still the source of truth?

## Failure Modes

- What happens when one downstream dependency fails?
- Can the BFF return partial responses safely?
- Are error formats normalized for the client?

