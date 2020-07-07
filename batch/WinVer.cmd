@echo off
cls
echo ---------------------------------------
echo  WinVer.cmd - 08/08/2018 - Cole Tirpak
echo ---------------------------------------
echo.

for /f "tokens=3-5" %%a in ('reg query "\\%1\HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v ProductName') do (
	set winver1=%%a
	set winver2=%%b
	set winver3=%%c
)

if %winver2%==10 (
	for /f "tokens=3*" %%d in ('reg query "\\%1\HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v ReleaseId') do @set winbuild=%%d
)

echo %winver1% %winver2% %winver3% %winbuild%
echo.

pause