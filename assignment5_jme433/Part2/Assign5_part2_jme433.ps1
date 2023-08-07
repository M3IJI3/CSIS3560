# $Credentials = Get-Credential
# $Credentials.Password | ConvertFrom-SecureString | Set-Content '.\assignment5_jme433\Part2\encrypted_password.txt'
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #

$username = "Administrator"
$encrypted = Get-Content '.\assignment5_jme433\Part2\encrypted_password.txt' | ConvertTo-SecureString
$Cred = New-Object System.Management.Automation.PSCredential($username, $encrypted)

$results = Invoke-Command -ComputerName WS2022-JME433 -UseSSL -ScriptBlock {Get-Process | Sort-Object -Property WS -Descending | Select-Object -First 5 -Property WS, Id, ProcessName} -Credential $Cred
$results = $results | Select-Object -Property WS, Id, ProcessName

$results | Export-Csv -Path '.\assignment5_jme433\Part2\Assign5_part2_jme433.csv' 

# Remove-PSSession -Session $session


