# Validate Template Before Build

`packer fmt` keeps the template readable and consistent.

`packer validate` checks whether the template is structurally sound enough to build.

Running those first shortens feedback time and prevents wasting a build on obvious configuration mistakes.
