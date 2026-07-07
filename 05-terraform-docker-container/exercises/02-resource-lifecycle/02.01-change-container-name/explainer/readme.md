# Change Container Name

Some infrastructure attributes are part of resource identity.

Changing a Docker container name can force replacement because Docker cannot have two containers with the same name and Terraform may need to recreate the resource to match configuration.
