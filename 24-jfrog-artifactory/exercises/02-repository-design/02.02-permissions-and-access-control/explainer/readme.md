# Permissions and Access Control

Artifactory permissions should follow lifecycle and responsibility.

Common roles:

- developers can read and deploy to development repositories.
- CI can deploy build outputs and publish build metadata.
- release managers or release automation can promote to release repositories.
- runtimes should be read-only.
- platform admins manage repository configuration.

Avoid broad delete and manage permissions. Release repository writes should be tightly controlled.

