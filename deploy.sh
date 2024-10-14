#!/bin/bash

# Pull the latest image
docker pull surutheen/dev:latest

# Stop the currently running container
docker stop react || true
docker rm react || true

# Run a new container with the latest image
docker run -idt --name react -p 80:80 surutheen/dev:latest

