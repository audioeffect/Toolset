#Pass computer parameter
Param
(
    $computername
)

#Introduction
Write-Host "--------------------------------------------------------------------------------"
Write-Host " WinVer.ps1 by Cole Tirpak - 03/05/2019"
Write-Host
Write-Host " Check the Windows version and build on remote host (\\$computername)..."
Write-Host "--------------------------------------------------------------------------------"
Write-Host

#Process
$path = '.\batch'

Start-Process -FilePath "$path\WinVer.cmd" -ArgumentList $computername -NoNewWindow