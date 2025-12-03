Import-Module Microsoft.Graph.Identity.SignIns
. .\Connect-Graph.ps1

Write-Host "`nExporting Conditional Access Policies..." -ForegroundColor Cyan

$policies = Get-MgIdentityConditionalAccessPolicy

$outputFolder = "./Exports/CA-Policies"
New-Item -ItemType Directory -Force -Path $outputFolder | Out-Null

foreach ($policy in $policies) {
    $filePath = "$outputFolder/$($policy.DisplayName).json"
    $policy | ConvertTo-Json -Depth 10 | Out-File $filePath
    Write-Host "Exported: $filePath" -ForegroundColor Green
}
