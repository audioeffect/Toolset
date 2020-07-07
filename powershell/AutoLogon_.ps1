#Pass computer parameter
Param
(
    $computername
)

function GetQuery {
    #Introduction
    Clear-Host
    Write-Host "--------------------------------------------------------------------------------"
    Write-Host " AutoLogon.ps1 by Cole Tirpak - 07/30/2019"
    Write-Host
    Write-Host " Toggle AutoAdminLogon value on remote host (\\$computername)..."
    Write-Host "--------------------------------------------------------------------------------"
    Write-Host

    $reg = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('LocalMachine',$computername)
    $regkey = $reg.OpenSubKey("Software\Microsoft\Windows NT\CurrentVersion\Winlogon",$true)
    $autolog = $regkey.GetValue("AutoAdminLogon")

    Write-Host Current AutoAdminLogon value: $autolog
    Write-Host

    $query = Read-Host "Would you like to toggle the value? (y/n)"
    Write-Host

    if($query -eq 'y'){
        Write-Host Changing value...
        Write-Host

        if($autolog -eq 1){
            $regkey.setvalue("AutoAdminLogon",0)
        }
        else{
            $regkey.setvalue("AutoAdminLogon",1)
        }

        Start-Sleep -Seconds 2
        GetQuery
    }

    Write-Host Exiting...
    Start-Sleep -Seconds 2
}

#Process
$isAdmin = ([Security.Principal.WindowsPrincipal] `
  [Security.Principal.WindowsIdentity]::GetCurrent() `
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if($isAdmin){
    GetQuery
}
else {
    $message = "Enter admin domain\username"
    $cred = Get-Credential -Message $message
    Start-Process -FilePath powershell.exe -ArgumentList ("-file powershell\AutoLogon.ps1 -executionpolicy bypass -computername $computername") -Credential $cred -NoNewWindow
}