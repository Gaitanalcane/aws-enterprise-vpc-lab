
$ErrorActionPreference = "Stop"

Write-Host "=== AWS Enterprise VPC Deployment ===" -ForegroundColor Cyan

terraform -chdir=terraform fmt -check
if ($LASTEXITCODE -ne 0) {
    throw "Terraform formatting check failed."
}

terraform -chdir=terraform validate
if ($LASTEXITCODE -ne 0) {
    throw "Terraform validation failed."
}

Write-Host "`nGenerating Terraform plan..." -ForegroundColor Yellow

terraform -chdir=terraform plan
if ($LASTEXITCODE -ne 0) {
    throw "Terraform plan failed."
}

Write-Host "`nPlan completed. Review all proposed changes before applying." -ForegroundColor Green
Write-Host "This script does NOT apply infrastructure changes."
