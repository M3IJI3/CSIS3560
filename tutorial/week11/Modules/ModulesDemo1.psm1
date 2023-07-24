function Show-Difference {
    param (
        [int] $x,
        [int] $y
    )
    return $x - $y
}

# below is not needed
Write-Host "Module is loaded."