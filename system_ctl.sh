#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

services=("bluetooth" "NetworkManager" "sddm")

for service in "${services[@]}"; do
    if systemctl list-units --full --all | grep -q "$service.service"; then
        sudo systemctl enable "$service"
    else
        echo "Warning: $service.service not found. Skipping..."
    fi
done