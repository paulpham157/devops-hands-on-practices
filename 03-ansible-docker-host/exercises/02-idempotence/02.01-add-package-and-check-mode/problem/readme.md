# Add Package and Check Mode

## Task

Add a harmless package such as `jq` to the package list in `site.yml`.

Run:

```bash
ansible-playbook -i inventory/hosts.ini site.yml --check
ansible-playbook -i inventory/hosts.ini site.yml
ansible-playbook -i inventory/hosts.ini site.yml
```

## Done When

The first apply reports a change, and the second apply reports no package change.
