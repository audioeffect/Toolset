#Pass computer parameter
Param
(
    $computername
)

#Introduction
Write-Host "-----------------------------------------------------------"
Write-Host " RDP.ps1 by Cole Tirpak - 03/06/2019"
Write-Host
Write-Host " Remote connect to PC with RDP  (\\$computername)..."
Write-Host "-----------------------------------------------------------"
Write-Host

#Process
pushd C:\Windows\System32
mstsc.exe /v:$computername