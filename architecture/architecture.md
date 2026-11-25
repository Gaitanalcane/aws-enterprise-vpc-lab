# Enterprise AWS VPC Architecture

## 1. Overview

A three-tier AWS network architecture deployed
in us-east-1 using Terraform.

## 2. Network Design

- VPC: 10.0.0.0/16
- 2 Availability Zones
- 2 Public Subnets
- 2 Private Subnets
- Internet Gateway
- Public and Private Route Tables

## 3. Security Architecture

- Web tier: HTTPS TCP 443
- Application tier: TCP 8080
- Database tier: MySQL TCP 3306
- Security Group references for internal traffic
- Least privilege network access

## 4. High Availability

Public and private subnets are distributed
across two Availability Zones.

## 5. Infrastructure as Code

All network resources are managed with Terraform.

## 6. Cost Considerations

No EC2 instances or NAT Gateways deployed.
No intentional hourly compute or NAT Gateway costs.
