
# AWS Enterprise VPC Lab

## Project Overview

This project builds and validates a secure, enterprise-style AWS
network infrastructure using Terraform.

## Objectives

- Design an isolated AWS VPC.
- Deploy public and private subnets across multiple Availability Zones.
- Configure Internet Gateway and route tables.
- Implement network security using Security Groups and Network ACLs.
- Validate network connectivity and access controls.
- Document infrastructure deployment, testing, and costs.

## Technology Stack

- Amazon Web Services (AWS)
- Terraform
- AWS CLI
- Git and GitHub
- PowerShell

## AWS Region

us-east-1

## Architecture

Architecture diagram: `architecture/vpc-architecture.png`

## Repository Structure

- `terraform/` — Infrastructure as Code
- `scripts/` — Deployment, validation, and cleanup scripts
- `architecture/` — Network architecture diagrams
- `documentation/` — Technical documentation
- `evidence/` — Actual validation results

## Security Principles

- Least privilege
- Network segmentation
- Restricted inbound access
- No hardcoded AWS credentials

## Cost Control

The lab has a maximum target budget of $10 USD.
All billable resources will be monitored and removed after testing.

## Security Groups

The VPC uses a three-tier security architecture.

| Tier | Direction | Protocol | Port | Allowed source/destination |
| --- | --- | --- | --- | --- |
| Web | Inbound | TCP | 443 | 0.0.0.0/0 |
| Web | Outbound | TCP | 8080 | App Security Group |
| App | Inbound | TCP | 8080 | Web Security Group |
| App | Outbound | TCP | 3306 | Database Security Group |
| Database | Inbound | TCP | 3306 | App Security Group |

Security principles:

- Least privilege
- Stateful security groups
- No direct database access from the Internet
- No unrestricted outbound rules
- Security group references instead of broad CIDR ranges for internal communication

All security groups and rules are managed with Terraform.

## Project Status

In progress.
