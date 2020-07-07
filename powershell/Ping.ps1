#Pass computer parameter
Param
(
    $computername
)

#Introduction
Write-Host "---------------------------------------------------"
Write-Host " Ping.ps1 by Cole Tirpak - 04/17/2018"
Write-Host
Write-Host " Run continuous ping on remote host (\\$computername)..."
Write-Host "---------------------------------------------------"
Write-Host
Write-host "Press Ctrl+C to exit"

#Process
ping $computername -t