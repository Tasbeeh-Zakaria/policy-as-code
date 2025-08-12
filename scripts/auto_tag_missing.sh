#!/bin/bash
# Simulated Auto-tag Azure resources missing "environment" tag
# Lab simulation – no real Azure login required

# Exit on error
set -e

GREEN="\033[1;32m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
RED="\033[1;31m"
RESET="\033[0m"

echo -e "${CYAN}🔍 Checking for untagged resources...${RESET}"
sleep 1

resources=(
    "/subscriptions/123/resourceGroups/rg1/providers/Microsoft.Compute/virtualMachines/vm1"
    "/subscriptions/123/resourceGroups/rg1/providers/Microsoft.Storage/storageAccounts/sa1"
)

for id in "${resources[@]}"; do
    echo -e "${YELLOW}⚡ Tagging resource:${RESET} $id"
    sleep 1
    echo -e "${GREEN}✅ Successfully tagged${RESET} $id with environment=prod"
done

echo -e "${CYAN}🏁 Tagging complete.${RESET}"
