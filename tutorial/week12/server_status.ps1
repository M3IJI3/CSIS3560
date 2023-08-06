$rows = Import-Csv -Path .\week12\servers.csv -Header "IPAddress","ServerName"
$status = @()

foreach($row in $rows){
    try {
        $output = @{
            IPAddress = $row.IPAddress
            ServerName = $row.ServerName
            IsOnline = $false
            Error = $null
            
        }
        if(Test-Connection -ComputerName $row.IPAddress -Count 1 -Quiet){
            $output.IsOnline = $true
        }
    }
    catch {
        
        <#Do this if a terminating exception happens#>
        $output.Error = $_.Exception.Message
       
    }
    finally{
        [PSCustomObject]$output
        $status += $output
    }
}

$status | ConvertTo-Json | Out-File .\week12\server_status.json