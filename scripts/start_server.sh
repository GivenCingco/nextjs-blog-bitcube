#!/bin/bash
# Check if Docker container is running
docker ps | grep nextjs-container

if [ $? -ne 0 ]; then
  echo "Next.js container failed to start."
  exit 1
else
  echo "Next.js container is running."
fi