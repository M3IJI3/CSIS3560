Get-Content -Path assignment5_jme433\Part1\ports.txt


# Display the header
function Show-Header {
    Write-Host("==============================================")
    Write-Host("    CSIS 3560 Assignement 5 (PowerShell)      ")
    Write-Host("    Name: Jie Mei                             ")
    Write-Host("    ID:   300364433                           ")
    Write-Host("==============================================")
}

function Get-PortsList{
    param (
        [Parameter(Mandatory=$true)]
        [string]$FileName
    )
    
    $FilePath = ".\assignment5_jme433\Part1\$FileName"

    $portsList = Get-Content -Path $FilePath

    return $portsList
}

# Display Port status
function Show-PortStatus{
    param (
        [Parameter(Mandatory=$true)]
        [int]$Port
    )
    

    $result = Test-Connection -ComputerName localhost -TcpPort $Port

    if($result)
    {
        $status = "Open"
    }
    else {
        $status = "Closed"
    }

    $portInfo = [PSCustomObject]@{
        Info = "Port:"+ $Port
        Value = $status
    }

    return $portInfo
}

# Display local system informtion
function Show-OSInfo{
    param (
        [Parameter(Mandatory=$true)]
        [string]$Option
    )

    $result = Get-ComputerInfo | Select-Object $Option

    $OSInfo = [PSCustomObject]@{
        Info = $Option
        Value = $result.$Option
    }

    return $OSInfo
}



