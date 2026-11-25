
# AWS Enterprise VPC - Security Analysis

## 1. Security Objectives

The network follows the principle of least privilege.
Each application tier has a dedicated Security Group.

## 2. Web Tier

- Security Group: Web
- Inbound: TCP 443 from 0.0.0.0/0
- Outbound: TCP 8080 to the App Security Group

HTTPS is the only explicitly configured inbound
Internet rule.

## 3. Application Tier

- Security Group: App
- Inbound: TCP 8080 from the Web Security Group
- Outbound: TCP 3306 to the Database Security Group

The application tier does not accept unrestricted
Internet ingress.

## 4. Database Tier

- Security Group: Database
- Inbound: TCP 3306 from the App Security Group
- No explicitly configured outbound rule

The database Security Group does not authorize
direct Internet ingress.

## 5. Security Principles

- Least privilege
- Stateful Security Groups
- Security Group references for internal traffic
- No unrestricted outbound rules
- No direct database ingress from the Internet

## 6. Important Limitations

Security Groups are network controls, not application
authentication mechanisms.

Database isolation also depends on subnet routing,
resource placement and other network controls.

No EC2 or database workload has been deployed yet.

## 7. Validation

The configured Security Group rules were inspected
using the AWS CLI.

Five rules were verified:

- Web inbound HTTPS
- Web outbound to App
- App inbound from Web
- App outbound to Database
- Database inbound from App
