#!/bin/bash

# Build Docker image
docker build -t react/dev:latest .

# Tag the image for the dev repository
docker tag react/dev:latest surutheen/dev:latest

