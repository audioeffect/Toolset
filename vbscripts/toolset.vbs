Function RunCommand(arg)
	check = verifyComputerName()
	If check = 0 then
		Set obj = CreateObject("Wscript.shell")
		If arg = "remote" then
			obj.run("powershell -executionpolicy bypass -file powershell\RemoteControl.ps1 -computername " & activeName)
		End If
		If arg = "rdp" then
			obj.run("powershell -executionpolicy bypass -file powershell\RDP.ps1 -computername " & activeName)
		End If
		If arg = "ping" then
			obj.run("powershell -executionpolicy bypass -file powershell\Ping.ps1 -computername " & activeName)
		End If
		If arg = "restart" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\Restart.ps1 -computername " & activeName)
		End If
		If arg = "psexec" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\PSExec.ps1 -computername " & activeName)
		End If
		If arg = "unc" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\UNC.ps1 -computername " & activeName)
		End If
		If arg = "gpupdate" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\GPUpdate.ps1 -computername " & activeName)
		End If
		If arg = "qwinsta" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\Qwinsta.ps1 -computername " & activeName)
		End If
		If arg = "deleteupdates" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\DeleteUpdates.ps1 -computername " & activeName)
		End If
		If arg = "deletecache" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\DeleteCache.ps1 -computername " & activeName)
		End If			
		If arg = "actions" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\Actions.ps1 -computername " & activeName)
		End If
		If arg = "sccmwmi" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\SCCM_WMI.ps1 -computername " & activeName)
		End If
		If arg = "wmi" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\WMI.ps1 -computername " & activeName)
		End If
		If arg = "mapprinters" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\MapPrinters.ps1 -computername " & activeName)
		End If
		If arg = "fastaccounts" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\FastAccounts.ps1 -computername " & activeName)
		End If
		If arg = "unloadtrend" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\UnloadTrend.ps1 -computername " & activeName)
		End If
		If arg = "nslookup" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\NSLookup.ps1 -computername " & activeName)
		End If
		If arg = "cmrcservice" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\CmRcService.ps1 -computername " & activeName)
		End If
		If arg = "sfc" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\SFC.ps1 -computername " & activeName)
		End If
		If arg = "uptime" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\Uptime.ps1 -computername " & activeName)
		End If
		If arg = "killkiosk" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\KillKiosk.ps1 -computername " & activeName)
		End If
		If arg = "mbamstatus" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\MBAMStatus.ps1 -computername " & activeName)
		End If
		If arg = "winver" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\WinVer.ps1 -computername " & activeName)
		End If
		If arg = "tasks" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\Tasks.ps1 -computername " & activeName)
		End If
		If arg = "autologon" then
			obj.run("powershell.exe -executionpolicy bypass -file powershell\AutoLogon.ps1 -computername " & activeName)
		End If
	End If
	Set obj = Nothing
End Function

Function OpenCollect()
	Set obj = CreateObject("Wscript.Shell")
	Set objIE = CreateObject("InternetExplorer.Application")
	objIE.Toolbar = 0
	objIE.Width = 600
	objIE.Height = 760
	objIE.Resizable = 0
	objIE.Visible = 1
	objIE.Navigate "http://collect.carle.com/search.asp"
	
	obj.AppActivate objIE
	Set objIE = Nothing
	Set obj = Nothing
End Function

Function LoanerSystems()
	set obj = CreateObject("Wscript.Shell")
	obj.run("shortcuts\ref.lnk")
	Set obj = Nothing
End Function

Function OpenFolder()
	Set obj = CreateObject("Wscript.Shell")
	obj.Run "explorer.exe /e,\\tsupport\tsupload\Cole\Scripts"
	Set obj = Nothing
End Function

Function RunUtilities(arg)
	Set obj = CreateObject("Wscript.shell")
	If arg = "cmd" then
		obj.run("powershell.exe -executionpolicy bypass -file powershell\CMD.ps1")
	End If
	If arg = "collect" then
		Set objIE = CreateObject("InternetExplorer.Application")
		objIE.Toolbar = 0
		objIE.Width = 600
		objIE.Height = 760
		objIE.Resizable = 0
		objIE.Visible = 1
		objIE.Navigate "http://collect.carle.com/search.asp"
		
		obj.AppActivate objIE
		Set objIE = Nothing		
	End If
	If arg = "loaner" then
		obj.run("shortcuts\ref.lnk")
	End If
	If arg = "mmc" then
		obj.Run("powershell.exe -executionpolicy bypass -file powershell\MMC.ps1")
	End If
	If arg = "scripts" then
		obj.Run "explorer.exe /e,\\tsupport\tsupload\Cole\Scripts"		
	End If
	If arg = "shutdown" then
		obj.run("powershell.exe -executionpolicy bypass -file powershell\Shutdown-I.ps1")
	End If
	Set obj = Nothing
End Function