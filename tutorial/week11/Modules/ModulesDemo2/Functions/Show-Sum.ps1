function Show-Sum {
    param (
        [int] $x,
        [int] $y
    )
    return $x + $y
}

Export-ModuleMember -Function Show-Sum