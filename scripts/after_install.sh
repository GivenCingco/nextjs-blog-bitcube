#!/bin/bash

#!/bin/bash
# Pull Docker image from DockerHub (replace with your repo)
docker pull your-dockerhub-username/your-nextjs-app:latest

# Stop and remove the existing container if it exists
docker stop nextjs-container || true
docker rm nextjs-container || true

# Run the container
docker run -d -p 80:3000 --name nextjs-container your-dockerhub-username/your-nextjs-app:latest