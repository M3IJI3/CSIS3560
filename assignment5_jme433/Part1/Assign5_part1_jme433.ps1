$module_folder = $PSScriptRoot + '\Modules';
$env:PSModulePath = $env:PSModulePath + ";$module_folder"

################################################################
<#
DO NOT CHANGE THE ABOVE LINE
MAKE SURE TO FOLLOW THE NAMING AND FOLDER STRUCTURE CONVENTION
WRITE YOUR CODE BELOW
#>
################################################################

Get-Module -Name Assign5_part1_jme433

Show-Header
$ports = Get-PortsList -FileName "Ports.txt"
$InfoArray = @(
    [PSCustomObject]@{
        Info = "Server"
        Value = "Localhost"
    }
)

# invoke Show-PortStaus function 
Write-Host("Checking the localhost's port status")
foreach($port in $ports)
{
    $item = Show-PortStatus -Port $port
    $InfoArray += $item
}

# get os information
Write-Host("Checking the localhost's OS info")
$OSName = Show-OSInfo OsName 
$InfoArray += $OSName

$OSVersion = Show-OSInfo OsVersion
$InfoArray += $OSVersion


$InfoArray | Format-Table -AutoSize

# conver the results to JSON file
$InfoArray | ConvertTo-Json | Out-File .\assignment5_jme433\Part1\Assign5_part1_jme433.json

Remove-Module Assign5_part1_jme433




