#Pass computer parameter
Param
(
    $computername
)

#Introduction
Write-Host "-------------------------------------------------------"
Write-Host " MBAM Status.ps1 by Cole Tirpak - 03/05/2019"
Write-Host
Write-Host " Check encryption status on remote host (\\$computername)..."
Write-Host "-------------------------------------------------------"
Write-Host

#Process
$path = ".\batch"
$user = Read-Host "Enter admin username"
runas /user:carle.com\$user "$path\MBAMStatus.cmd $computername"