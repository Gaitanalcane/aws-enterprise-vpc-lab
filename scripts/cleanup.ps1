
$ErrorActionPreference = "Stop"

Write-Host "=== AWS Enterprise VPC Cleanup ===" -ForegroundColor Red

$terraformDir = Join-Path $PSScriptRoot "..\terraform"
$terraformDir = [System.IO.Path]::GetFullPath($terraformDir)

if (-not (Test-Path (Join-Path $terraformDir "main.tf"))) {
    throw "Terraform directory or main.tf not found: $terraformDir"
}

$planFile = "cleanup.tfplan"

Write-Host "`nWARNING: This operation can destroy AWS resources." -ForegroundColor Yellow

$confirmation = Read-Host "Type DESTROY to generate a destruction plan"

if ($confirmation -cne "DESTROY") {
    Write-Host "Cleanup cancelled. No resources changed." -ForegroundColor Green
    return
}

Push-Location $terraformDir

try {
    Write-Host "`nGenerating destruction plan..." -ForegroundColor Yellow

    terraform plan -destroy -out=$planFile

    if ($LASTEXITCODE -ne 0) {
        throw "Terraform destroy plan failed."
    }

    Write-Host "`nReview the plan carefully." -ForegroundColor Red

    $finalConfirmation = Read-Host "Type APPLY-DESTROY to execute the plan"

    if ($finalConfirmation -cne "APPLY-DESTROY") {
        Remove-Item $planFile -ErrorAction SilentlyContinue
        Write-Host "Destruction cancelled. Infrastructure unchanged." -ForegroundColor Green
        return
    }

    terraform apply $planFile

    if ($LASTEXITCODE -ne 0) {
        throw "Terraform destroy operation failed."
    }

    Remove-Item $planFile -ErrorAction SilentlyContinue

    Write-Host "`nCleanup completed successfully." -ForegroundColor Green
}
finally {
    Pop-Location
}
