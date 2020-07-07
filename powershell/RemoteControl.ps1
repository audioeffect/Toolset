#Pass computer parameter
Param
(
    $computername
)

#Introduction
Write-Host "-------------------------------------------------------------"
Write-Host " RemoteControl.ps1 by Cole Tirpak - 03/05/2019"
Write-Host
Write-Host " Connect Remote Control Viewer to remote host (\\$computername)..."
Write-Host "-------------------------------------------------------------"
Write-Host

#Process
Start-Process -FilePath '.\shortcuts\rcv.lnk' $computername