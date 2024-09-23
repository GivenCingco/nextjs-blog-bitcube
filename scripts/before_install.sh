#!/bin/bash

# Update instance
sudo yum update -y

# Install Docker
sudo yum -y install docker

# Start Docker service
sudo service docker start

# Modify user permissions
sudo usermod -a -G docker ec2-user

# Make directory to save application files
mkdir downloads
cd downloads

#Verify Docker installation
docker --version