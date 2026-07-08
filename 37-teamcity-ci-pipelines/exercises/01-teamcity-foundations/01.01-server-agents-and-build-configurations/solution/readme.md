# Server, Agents, and Build Configurations

| Responsibility | Best First Component |
| --- | --- |
| Store build history and project settings | TeamCity server |
| Execute a Docker build with internal network access | Build agent in the right pool |
| Define the `Build and Test` stage | Build configuration |

Agent pools let teams isolate permissions, network reachability, and capacity by workload type.
