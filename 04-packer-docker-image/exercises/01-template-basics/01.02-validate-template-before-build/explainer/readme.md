# Validate Template Before Build

Packer workflows are safer when validation happens before a full build.

`packer fmt` normalizes structure, while `packer validate` catches missing variables, bad references, and some configuration errors before spending time on the image build.

This is the same discipline as reviewing a Terraform plan before apply.
