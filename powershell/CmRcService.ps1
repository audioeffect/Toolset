Param
(
    [switch]$Elevated,
    [string]$computername
)

# Import module and run script elevated
if(!$Elevated){
    Import-Module  "\\tsupport\tsupload\Cole\PS\Modules\Restart-Elevated.psm1"
    Restart-Elevated -PassedCommand $PSCommandPath -PassedParam $PSBoundParameters
}

#Introduction
Write-Host "----------------------------------------------------------------------------------"
Write-Host " CmRcService.ps1 by Cole Tirpak - 07/30/2019"
Write-Host
Write-Host " Restart Configuration Manager Remote Control Service on remote host (\\$computername)..."
Write-Host "----------------------------------------------------------------------------------"
Write-Host

Write-Host Restarting service on $computername...
Get-Service -Name CmRcService -ComputerName $computername | Stop-Service
Get-Service -Name CmRcService -ComputerName $computername
Write-Host

Get-Service -Name CmRcService -ComputerName $computername | Start-Service
Get-Service -Name CmRcService -ComputerName $computername
Write-Host

Pause
exit