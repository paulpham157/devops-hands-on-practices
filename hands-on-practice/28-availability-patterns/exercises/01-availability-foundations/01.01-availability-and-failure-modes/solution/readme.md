# Availability and Failure Modes

| Situation | Meaningfully Available? | Reason |
| --- | --- | --- |
| Checkout works, recommendations are disabled | Yes | core business path still works |
| Every request returns 500 after dependency timeout cascade | No | system is not serving useful responses |
| Search results are delayed but eventually appear from queue processing | Usually yes | system remains operational with delayed completion |
| Login is up, but payment path always fails | Only partly | some functionality is available, but a critical journey is not |

