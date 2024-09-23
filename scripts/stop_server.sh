#!/bin/bash

# Define your container name
CONTAINER_NAME="nextjs-dev"

# Stop the Docker container if it's running
if [ $(docker ps -q -f name=$CONTAINER_NAME) ]; then
    echo "Stopping the Docker container: $CONTAINER_NAME"
    docker stop $CONTAINER_NAME
else
    echo "No running container found with name: $CONTAINER_NAME"
fi