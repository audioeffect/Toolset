#Pass computer parameter
Param
(
    $computername
)

#Introduction
Write-Host "------------------------------------"
Write-Host " Restart.ps1 by Cole Tirpak - 04/17/2018"
Write-Host
Write-Host " Restart remote host (\\$computername)..."
Write-Host "------------------------------------"
Write-Host

#Process
$user = Read-Host Enter admin username
$cred = Get-Credential -Credential "carle.com\$user"

Write-Host
Write-Host "Restarting $computername..."
Restart-Computer -ComputerName $computername -Credential $cred -Force

Write-Host
Write-Host "Starting continuous ping to track restart. Press Ctrl+C to exit"
ping $computername -t