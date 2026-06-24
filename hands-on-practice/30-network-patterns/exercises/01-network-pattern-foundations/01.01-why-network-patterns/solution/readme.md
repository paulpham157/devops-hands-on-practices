# Why Network Patterns

| Problem | Strong Fit? | Likely Pattern |
| --- | --- | --- |
| Client must call many backends to render one screen | Yes | Gateway Aggregation |
| Many services need the same outbound auth logic to reach one partner API | Yes | Ambassador |
| App servers are streaming static images unnecessarily | Yes | Static Content Hosting |
| Core pricing rules need to stay in the domain model | No | not mainly a network pattern |

