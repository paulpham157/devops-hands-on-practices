# Reporting and Drift Control

| Drift Example | Auto-Correct | Report Only | Human Review First |
| --- | --- | --- | --- |
| `/etc/motd` changed | Yes | No | No |
| security package missing | Often yes | No | Sometimes |
| Docker daemon config changed on a payment node | No | No | Yes |

Auto-correcting everything can hide active incidents or overwrite deliberate emergency changes before responders understand the cause.
