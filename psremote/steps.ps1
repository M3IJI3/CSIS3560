New-NetFirewallRule -Name 'ICMPv4' -DisplayName 'ICMPv4' -Profile Any -Direction Inbound -Protocol ICMPv4

Get-NetFirewallRule | Where-Object Name -Like 'ICMPv4'

$Cert = New-SelfSignedCertificate -CertStoreLocation Cert:\LocalMachine\My -DnsName WS2022-JME433

# run mmc and apply for a certificate, delete the previous one

Export-Certificate -Cert $Cert -FilePath C:\temp\cert-jme433

# clear old listener 
remove-Item -Path WSMan:\localhost\Listener\Listener* -Recurse

Enable-PSRemoting -SkipNetworkProfileCheck -Force
dir WSMan:\localhost\Listener

New-Item -Path WSMan:\localhost\Listener -Transport HTTPS -Address * -CertificateThumbPrint $Cert.Thumbprint -Force
New-NetFirewallRule -DisplayName "Windows Remote Management (HTTPS-In)" -Name "Windows Remote Management(HTTPS-In)" -Profile Any -LocalPort 5986 -Protocol TCP
Set-Item WSMan:\localhost\Service\EnableCompatibilityHttpListener -Value true
Set-Item WSMan:\localhost\Client\TrustedHosts -Value *

Import-Certificate -FilePath "C:\temp\cert-JME433" -CertStoreLocation "Cert:\LocalMachine\Root"


# Get-CimInstance
# local disk
Get-CimInstance -ClassName Win32_LogicalDisk 
(Get-CimInstance -ClassName Win32_LogicalDisk).FreeSpace
[Math]::Round(((Get-CimInstance -ClassName Win32_LogicalDisk).FreeSpace[0] / 1GB),1)

# memory
(Get-CimInstance -ClassName Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum) / 1GB 

# ip address
(Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration -Filter "IPEnable = 'True'").IPAddress[0]

# OS and users
Get-CimInstance -ClassName Win32_OperatingSystem
(Get-CimInstance -ClassName Win32_OperatingSystem).OSType
(Get-CimInstance -ClassName Win32_OperatingSystem) | Select-Object -Property Build*,OSType
(Get-CimInstance -ClassName Win32_OperatingSystem) | Select-Object -Property *user*

# current logon user
Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -Property *user*

# Processor
Get-CimInstance -ClassName Win32_Processor
Get-CimInstance -ClassName Win32_Processor | Select-Object *numbers*

