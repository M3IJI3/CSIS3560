New-Item -Path WSMan:\LocalHost\Listener -Transport HTTPS -Address * -CertificateThumbPrint $Cert.Thumbprint -Force

New-NetFirewallRule -DisplayName "Windows Remote Management (HTTPS-In)" -Name "Windows Remote Management (HTTPS-In)" -Profile Any -LocalPort 5986 -Protocol TCP

Set-Item WSMan:\localhost\Service\EnableCompatibilityHttpsListener -Value true

Set-Item WSMan:localhost\client\trustedhosts -value * 