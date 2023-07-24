function Show-Product {
    param (
        [int] $x,
        [int] $y
    )
    return $x * $y
}

Export-ModuleMember -Function Show-Product