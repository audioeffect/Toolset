@echo off
echo ----------------------------------------
echo  DelUpdates.cmd - 4/19/18 - Cole Tirpak
echo ----------------------------------------
echo.

set path=C:\Windows\SoftwareDistribution

net stop bits
net stop wuauserv
echo.

if exist %path% (
	del C:\Windows\SoftwareDistribution /s /q
	rmdir C:\Windows\SoftwareDistribution /s /q
) else (
	echo Directory doesn't exist.
)
echo.

net start bits
net start wuauserv
echo.

set /p prompt=Actions complete. Press ENTER to exit...