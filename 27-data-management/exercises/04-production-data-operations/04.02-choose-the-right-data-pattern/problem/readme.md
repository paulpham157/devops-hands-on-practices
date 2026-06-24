# Choose the Right Data Pattern

Choose the strongest first pattern for each case.

1. Customer order history is read far more often than it is written, and the UI can tolerate a short delay.
2. Payment, inventory, and shipping are owned by separate services and must coordinate a business workflow.
3. A domain needs full state-change history and replay capability.
4. A large append-heavy dataset must scale horizontally by tenant or time window.

Explain one tradeoff for each choice.

