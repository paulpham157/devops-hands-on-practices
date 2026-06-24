# Choose the Right Availability Pattern

The right pattern depends on failure shape.

Strong signals for health monitoring:

- routing and orchestration decisions need health state

Strong signals for queue-based load leveling:

- demand is bursty and work can complete asynchronously

Strong signals for throttling:

- overload must be contained before collapse

Strong signals for graceful degradation:

- optional dependencies should not take down critical user journeys

