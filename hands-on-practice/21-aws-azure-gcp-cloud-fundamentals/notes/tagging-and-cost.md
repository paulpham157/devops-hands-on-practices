# Tagging, Labels, and Cost

Cloud providers use tags or labels to group resources.

Common keys:

```text
environment
owner
team
cost-center
application
data-classification
managed-by
```

## AWS

AWS uses tags on many resources.

Example:

```text
Environment=dev
Owner=platform
CostCenter=training
```

## Azure

Azure supports tags on resource groups and resources.

Example:

```text
environment=dev
owner=platform
cost-center=training
```

## Google Cloud

Google Cloud supports labels on many resources and tags for policy-oriented use cases.

Example labels:

```text
environment=dev
owner=platform
cost_center=training
```

## Practice Rule

No production resource should be created without an owner, environment, application, and cost allocation field.

