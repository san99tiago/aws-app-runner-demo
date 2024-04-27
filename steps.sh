#!/bin/bash

# Create private ECR repo (manually in console)
ACCOUNT=XXXXX # Replace with real account number
create private ECR repo
# Will generate --> $ACCOUNT.dkr.ecr.us-east-1.amazonaws.com/deleteme

# Follow steps to login to ECR via terminal
docker login

# Build Docker image
docker build -t hotel

# Tag image and push to ECR
Tag docker image and push it to ECR
docker tag hotel:latest $ACCOUNT.dkr.ecr.us-east-1.amazonaws.com/deleteme:latest
docker push $ACCOUNT.dkr.ecr.us-east-1.amazonaws.com/deleteme:latest

# Create apprunner app connected to ECR (apprunner-> service-> create)
# ... Add IAM Role
# ... wait for deploy
