#!/bin/bash
# Check if the application is running by accessing the public IP
curl -I http://$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)

if [ $? -ne 0 ]; then
  echo "Application validation failed."
  exit 1
else
  echo "Application is up and running."
fi