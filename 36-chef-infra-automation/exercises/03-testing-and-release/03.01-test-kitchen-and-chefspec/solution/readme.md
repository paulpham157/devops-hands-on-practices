# Test Kitchen and ChefSpec

1. Test Kitchen converges the instance.
2. InSpec verifies that `/etc/docker/daemon.json` exists.
3. Keeping verification near the cookbook reduces drift between intended behavior and release checks.
