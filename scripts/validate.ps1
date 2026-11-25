
$ErrorActionPreference = "Stop"

$Profile = "cloud-admin"
$Region = "us-east-1"
$VpcId = "vpc-09c243b7a1992a86b"

Write-Host "=== AWS Enterprise VPC Validation ===" -ForegroundColor Cyan

Write-Host "`n1. Checking AWS identity..." -ForegroundColor Yellow
aws sts get-caller-identity --profile $Profile --region $Region --no-cli-pager

if ($LASTEXITCODE -ne 0) {
    throw "AWS authentication failed."
}

Write-Host "`n2. Checking VPC..." -ForegroundColor Yellow
aws ec2 describe-vpcs `
    --vpc-ids $VpcId `
    --profile $Profile `
    --region $Region `
    --no-cli-pager

if ($LASTEXITCODE -ne 0) {
    throw "VPC validation failed."
}

Write-Host "`n3. Checking subnets..." -ForegroundColor Yellow
aws ec2 describe-subnets `
    --filters "Name=vpc-id,Values=$VpcId" `
    --profile $Profile `
    --region $Region `
    --no-cli-pager

if ($LASTEXITCODE -ne 0) {
    throw "Subnet validation failed."
}

Write-Host "`n4. Checking Terraform..." -ForegroundColor Yellow
terraform -chdir=terraform validate

if ($LASTEXITCODE -ne 0) {
    throw "Terraform validation failed."
}

Write-Host "`nValidation completed successfully." -ForegroundColor Green
