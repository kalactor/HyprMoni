#!/usr/bin/env bash

services=("bluetooth" "NetworkManager" "sddm")

for service in "${services[@]}"; do
        sudo systemctl enable "$service"
done