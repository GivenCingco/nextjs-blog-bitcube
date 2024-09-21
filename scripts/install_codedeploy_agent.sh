#!/bin/bash
# Update the package repository and install dependencies
sudo yum update -y
sudo yum install -y ruby wget

# Download and install the CodeDeploy agent
cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto

# Start the CodeDeploy agent
sudo service codedeploy-agent start

# Check if the CodeDeploy agent is running
sudo service codedeploy-agent status
