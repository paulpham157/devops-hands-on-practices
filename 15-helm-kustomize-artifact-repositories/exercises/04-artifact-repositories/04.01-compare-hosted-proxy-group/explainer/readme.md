# Explainer: Compare Repository Modes

Artifact repositories reduce supply-chain risk and make builds repeatable.

Nexus terms:

| Mode | Meaning |
| --- | --- |
| hosted | Store internal artifacts |
| proxy | Cache upstream artifacts |
| group | One URL that combines hosted and proxy repositories |

Artifactory terms:

| Mode | Meaning |
| --- | --- |
| local | Store internal artifacts |
| remote | Cache upstream artifacts |
| virtual | One URL that combines local and remote repositories |

The names differ, but the pattern is similar.

