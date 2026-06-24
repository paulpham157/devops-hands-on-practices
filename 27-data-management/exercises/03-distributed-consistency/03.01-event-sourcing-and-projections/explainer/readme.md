# Event Sourcing and Projections

Event sourcing stores state changes as a sequence of events.

Current state is reconstructed from that event history or from snapshots plus events.

Projections consume those events to build read models for specific query use cases.

