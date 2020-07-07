#Pass computer parameter
Param
(
    $computername
)

#Introduction
Write-Host "-------------------------------------------------"
Write-Host " MapPrinters.ps1 by Cole Tirpak - 03/05/2019"
Write-Host
Write-Host " Run Map Printers for remote host (\\$computername)..."
Write-Host "-------------------------------------------------"
Write-Host

#Process
$path = ".\batch"
$user = Read-Host "Enter admin username"
$cred=Get-Credential -Credential carle.com\$user
Start-Process -FilePath "$path\MapPrinters.cmd" -ArgumentList "$computername" -Credential $cred