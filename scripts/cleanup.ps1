
$ErrorActionPreference = "Stop"

Write-Host "=== AWS Enterprise VPC Cleanup ===" -ForegroundColor Red

Write-Host "`nWARNING: This operation can destroy AWS resources." -ForegroundColor Yellow

$confirmation = Read-Host "Type DESTROY to review the Terraform destroy plan"

if ($confirmation -cne "DESTROY") {
    Write-Host "Cleanup cancelled. No resources were changed." -ForegroundColor Green
    exit 0
}

Write-Host "`nGenerating destruction plan..." -ForegroundColor Yellow

terraform -chdir=terraform plan -destroy -out=cleanup.tfplan

if ($LASTEXITCODE -ne 0) {
    throw "Terraform destroy plan failed."
}

Write-Host "`nReview the plan carefully before continuing." -ForegroundColor Red

$finalConfirmation = Read-Host "Type APPLY-DESTROY to execute the destruction plan"

if ($finalConfirmation -cne "APPLY-DESTROY") {
    Remove-Item terraform/cleanup.tfplan -ErrorAction SilentlyContinue
    Write-Host "Destruction cancelled. Infrastructure remains unchanged." -ForegroundColor Green
    exit 0
}

terraform -chdir=terraform apply cleanup.tfplan

if ($LASTEXITCODE -ne 0) {
    throw "Terraform destroy operation failed."
}

Remove-Item terraform/cleanup.tfplan -ErrorAction SilentlyContinue

Write-Host "`nCleanup completed." -ForegroundColor Green
