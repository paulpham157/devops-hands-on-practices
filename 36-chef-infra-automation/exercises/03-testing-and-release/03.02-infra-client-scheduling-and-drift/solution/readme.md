# chef-client Scheduling and Drift

| Fleet Characteristic | Short Interval | Long Interval | Manual Only |
| --- | --- | --- | --- |
| Compliance-critical internal app VMs | Yes | No | No |
| Rarely touched analytics jump hosts | No | Yes | No |
| Sensitive production nodes during incident response | No | No | Yes |

A single interval ignores different risk levels, change windows, and blast-radius concerns.
