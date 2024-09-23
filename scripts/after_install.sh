#!/bin/bash

# Retrieve values from SSM Parameter Store
AWS_REGION=$(aws ssm get-parameter --name "/myapp/aws-region" --query "Parameter.Value" --output text)
ECR_REPOSITORY=$(aws ssm get-parameter --name "/myapp/ecr-repository" --query "Parameter.Value" --output text)
IMAGE_TAG=$(aws ssm get-parameter --name "/myapp/image-tag" --query "Parameter.Value" --output text)
CONTAINER_NAME=$(aws ssm get-parameter --name "/myapp/container-name" --query "Parameter.Value" --output text)

# Debugging output
echo "AWS_REGION: $AWS_REGION"
echo "ECR_REPOSITORY: $ECR_REPOSITORY"
echo "IMAGE_TAG: $IMAGE_TAG"
echo "CONTAINER_NAME: $CONTAINER_NAME"

# Pull Docker image from ECR
echo "Pulling image from ECR: $ECR_REPOSITORY:$IMAGE_TAG"
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
docker pull $ECR_REPOSITORY:$IMAGE_TAG

# Stop and remove existing container if it exists
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# Run the Docker container
echo "Running Docker container: $CONTAINER_NAME"
docker run -d -p 80:3000 --name $CONTAINER_NAME $ECR_REPOSITORY:$IMAGE_TAG