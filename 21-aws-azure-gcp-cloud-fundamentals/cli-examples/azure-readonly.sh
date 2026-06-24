#!/usr/bin/env sh
set -eu

echo "These commands require Azure CLI and login."
echo "They are read-only examples."

cat <<'COMMANDS'
az account show --output table
az account list-locations --output table
az group list --output table
az vm list --output table
az network vnet list --output table
az resource list --query "[].{name:name,type:type,location:location}" --output table
COMMANDS

