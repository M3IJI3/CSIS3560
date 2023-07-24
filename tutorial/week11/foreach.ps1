# formally you need to type Get-Content -Path .\servers.txt
$servers = (Get-Content .\week11\servers.txt)

# loop through the $servers using foreach 
foreach ($server in $servers){
    Write-Host "Server $server"

    if (Test-Connection -TargetName $server -Quiet -Count 1){
        Write-Host "Reachable"
    }
    else{
        Write-Error "Not reachable"
    }
}