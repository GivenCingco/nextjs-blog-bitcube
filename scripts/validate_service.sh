#!/bin/bash

# Retrieve the public IP
PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)

# Check if the public IP was retrieved successfully
if [ -z "$PUBLIC_IP" ]; then
  echo "Failed to retrieve public IP."
  exit 1
fi

# Check if the application is running by accessing the public IP
curl -I http://$PUBLIC_IP

if [ $? -ne 0 ]; then
  echo "Application validation failed."
  exit 1
else
  echo "Application is up and running."
fi
