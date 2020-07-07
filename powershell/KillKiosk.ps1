#Pass computer parameter
Param
(
    $computername
)

#Introduction
Write-Host "-------------------------------------------------"
Write-Host " KillKiosk.ps1 by Cole Tirpak - 03/05/2019"
Write-Host
Write-Host " Run Kill Kiosk for remote host (\\$computername)..."
Write-Host "-------------------------------------------------"
Write-Host

#Process
$path = ".\batch"
$user=Read-Host Enter admin username
$cred=Get-Credential -Credential carle.com\$user
$pass=$cred.GetNetworkCredential().Password
Start-Process -FilePath "$path\KillKiosk.cmd" -ArgumentList "$computername $user $pass" -Credential $cred