
# AWS Enterprise VPC - Cost Analysis

## 1. Project Cost Objectives

The project is designed to keep AWS costs low
while providing practical enterprise networking experience.

The target learning budget is $10.

## 2. Deployed Network Resources

The following resources are deployed:

- One VPC
- Four subnets
- One Internet Gateway
- Route tables and route associations
- Three Security Groups

These networking components do not have
an hourly usage charge by themselves.

## 3. Resources Not Deployed

The project currently has no:

- EC2 instances
- NAT Gateway
- Application Load Balancer
- RDS database
- Interface VPC Endpoints

These services can introduce hourly or usage-based
charges and have not been deployed.

## 4. Potential Additional Costs

Some AWS services can still generate charges:

- Public IPv4 addresses associated with resources
- CloudTrail log storage in Amazon S3
- S3 storage and API requests
- Data transfer
- Other services created outside this Terraform project

The public subnet setting that automatically assigns
public IP addresses does not itself create an hourly
charge. Charges can apply when public IPv4 addresses
are allocated or associated with resources.

## 5. Cost Management Strategy

- Avoid deploying NAT Gateways for this lab.
- Avoid leaving EC2 instances running.
- Review Terraform plans before applying changes.
- Check AWS Billing and Cost Explorer regularly.
- Configure budget alerts.
- Destroy resources when the lab is no longer needed.

## 6. Important Billing Warning

AWS Budgets alerts do not automatically stop resources
or prevent additional charges.

Billing information can also be delayed.

Always verify actual usage and charges in the AWS
Billing Console.

## 7. Conclusion

The current VPC network design avoids major
hourly infrastructure costs.

However, this does not guarantee a zero AWS bill.
Other services, including the existing CloudTrail
and S3 logging setup, may generate charges.
