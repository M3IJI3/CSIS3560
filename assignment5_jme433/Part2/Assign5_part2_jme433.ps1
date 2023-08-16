Import-Certificate -FilePath ".\cert\cert-assign5" -CertStoreLocation "Cert:\LocalMachine\Root\"

# $Credentials = Get-Credential
# $Credentials.Password | ConvertFrom-SecureString | Set-Content '.\Part2\encrypted_password.txt'
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #

$username = "Administrator"
$encrypted = Get-Content '.\Part2\encrypted_password.txt' | ConvertTo-SecureString
$Cred = New-Object System.Management.Automation.PSCredential($username, $encrypted)

$results = Invoke-Command -ComputerName WS2022-JME433 -UseSSL -ScriptBlock {Get-Process | Sort-Object -Property WS -Descending | Select-Object -First 5 -Property WS, Id, ProcessName} -Credential $Cred
$results = $results | Select-Object -Property WS, Id, ProcessName

$results | Export-Csv -Path '.\Part2\Assign5_part2_jme433.csv' 

# Remove-PSSession -Session $session


