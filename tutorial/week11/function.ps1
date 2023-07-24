# This is an example of a function in PS

function Install-Software {
    param (
        # Parameter help description
        [Parameter(Mandatory)] [ValidateSet('1','2')]
        [string] $Version,

        # Parameter help description
        [Parameter(Mandatory, ValueFromPipeline)] 
        [string] $ComputerName
    )

    process{
        Write-Host "Software version $Version was installed on $ComputerName"
    }
}

# below is an example on how to call the above function
$computers = @("SRV1", "SRV2", "SRV3")
$computers | Install-Software -Version 2