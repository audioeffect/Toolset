@echo off
echo --------------------------------------
echo  DelCache.cmd - 4/19/18 - Cole Tirpak
echo --------------------------------------
echo.

set path=C:\Windows\ccmcache

if exist %path% (
	del C:\Windows\ccmcache /s /q
	rmdir C:\Windows\ccmcache /s /q
) else (
	echo Directory doesn't exist.
)
echo.

set /p prompt=Actions complete. Press ENTER to exit...