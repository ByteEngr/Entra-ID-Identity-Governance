param(
    [Parameter(Mandatory)]
    [string]$PolicyFile
)

Import-Module Microsoft.Graph.Identity.SignIns
. .\Connect-Graph.ps1

if (-Not (Test-Path $PolicyFile)) {
    Write-Host "Policy file not found." -ForegroundColor Red
    exit
}

Write-Host "Deploying Conditional Access Policy..." -ForegroundColor Cyan

$policyJson = Get-Content $PolicyFile -Raw | ConvertFrom-Json

New-MgIdentityConditionalAccessPolicy -BodyParameter $policyJson

Write-Host "Policy deployed successfully." -ForegroundColor Green
