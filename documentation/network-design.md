
# AWS Enterprise VPC - Network Design

## 1. Project Overview

This project implements a segmented AWS network
using Terraform in the us-east-1 region.

The design uses two Availability Zones to improve
network availability and resilience.

## 2. VPC Configuration

- VPC CIDR: 10.0.0.0/16
- Region: us-east-1
- DNS Support: Enabled
- DNS Hostnames: Enabled

## 3. Subnet Architecture

| Subnet | CIDR | Availability Zone | Tier |
| --- | --- | --- | --- |
| Public 1 | 10.0.1.0/24 | us-east-1a | Public |
| Private 1 | 10.0.2.0/24 | us-east-1a | Private |
| Public 2 | 10.0.3.0/24 | us-east-1b | Public |
| Private 2 | 10.0.4.0/24 | us-east-1b | Private |

## 4. Internet Connectivity

The public route table contains:

- Local VPC route: 10.0.0.0/16
- Internet route: 0.0.0.0/0 through the Internet Gateway

The private route table contains:

- Local VPC route: 10.0.0.0/16

No NAT Gateway is deployed.

Private subnets therefore have no configured
direct Internet route.

## 5. Availability

Public and private subnets are distributed
across two Availability Zones.

This provides a foundation for a highly available
application architecture.

## 6. Workload Status

The VPC, subnets, routing components and Security
Groups are deployed.

No EC2 instances or database workloads have
been deployed yet.
