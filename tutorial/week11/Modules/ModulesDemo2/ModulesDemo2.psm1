Get-ChildItem -Path $PSScriptRoot .\Functions | ForEach-Object -Process { . $PSItem.FullName}

Write-Host "Module 2 is loaded"