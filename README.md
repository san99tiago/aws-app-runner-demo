# AppRunner Hotel App (DEMO)

**Note: This is not Production grade and simply meant as a demo**

Original repo: https://github.com/aws-samples/apprunner-hotel-app

## Description

This project provisions the base layer infrastructure to demonstrate how AppRunner leverages a VPC Connector to interact with a DB in a private subnet.

## AWS Services

- VPC (private + public subnets, IGW, NGW)
- Aurora MySQL in private subnet
- VPC Connector for AppRunner and requisite security groups
- Secrets Manager for DB credentials

**Note** : AWS App Runner is currently available in [these regions](https://docs.aws.amazon.com/general/latest/gr/apprunner.html):

- us-east-1
- us-east-2
- us-west-2
- ap-northeast-1
- eu-west-1

## Deployment Instructions

- Select a region where App Runner is available
- Create a Cloudformation stack using _base-infra.yaml_
- Deploy the application using the AppRunner Console.
  - Source
    - Point to your Github repo
  - Configure Build
    - Runtime: _Nodejs 16_
    - Build command: _npm install_
    - Start command: _npm start_
    - Port: _8080_ (default)
  - Configure service
    - Environment variable:
      - MYSQL*SECRET: \_DBSecret ARN* (Provisioned by base-infra.yaml. See Outputs tab)
      - HOTEL*NAME: \_HotelName ARN* (Provisioned by base-infra.yaml. See Outputs tab)
    - Security: _AppRunnerHotelAppRole_ (Provisioned by base-infra.yaml)
    - Networking:
      - Custom VPC: _AppRunnerV2NPrototype-RDS-Connector_ (Provisioned by infra.yaml)
    - Observability: Enable Tracing with AWS X-Ray

## Teardown Instructions

- Go to AppRunner console and delete the service.
- Go to Cloudformation and delete the stack.
