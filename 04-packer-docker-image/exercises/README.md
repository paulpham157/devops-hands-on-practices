# Exercises: Build an Image with Packer

## Sections

1. `01-template-basics`
   - Change static content and rebuild the image.
   - Validate the template before running a build.
2. `02-provisioning`
   - Add a package during image provisioning.
   - Inspect whether the baked image really contains the provisioned files.
3. `03-tagging`
   - Change version tags safely.
4. `04-post-processors`
   - Add an additional local image tag.
   - Avoid ambiguous tags in a repeatable release flow.
5. `05-comparison`
   - Compare Packer image baking with Dockerfile builds.

## Suggested Flow

Move from content change to image metadata and design tradeoffs.

```text
edit files -> validate template -> build image -> run/inspect image
```

## Completion Target

By the end, you should be able to explain:

- What Packer validates before a build.
- How provisioners change the baked image.
- How image tags affect repeatability.
- When Packer is useful beyond Docker image builds.
