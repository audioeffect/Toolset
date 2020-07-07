@echo off
cls
echo --------------------------------------
echo  Qwinsta.cmd - 03/08/19 - Cole Tirpak
echo --------------------------------------
echo.

set limit=0

:start
set computer=%1
goto :query

:pc
set /p computer=Computer name?: 
echo.

:query
psexec \\%computer% qwinsta
echo.
if %limit% EQU 1 (
	set limit=0
	goto :retry
)

:sesh
set /p user=Session # to logoff? ('q' to quit): 
echo.

if %user% EQU q (
	goto :retry
)
psexec \\%computer% logoff %user%
::set limit=1
goto :query
echo.

:retry
echo -----------------------------
echo.
echo What would you like to do?
echo.
echo # 1 - Logoff another computer
echo # 2 - Logoff another user
echo # q - Quit
echo.
set /p prompt=Selection: 
echo.

if %prompt% EQU 1 (
	goto :pc
)
if %prompt% EQU 2 (
	goto :sesh
)
goto :quit

:quit
echo Exiting...
timeout -t 2 > nul
exit