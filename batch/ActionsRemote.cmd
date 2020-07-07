:start
@echo off
cls
echo --------------------------------------------
echo  ActionsRemote.cmd - 03/08/19 - Cole Tirpak
echo --------------------------------------------
echo.

timeout -t 2 > nul
psexec -u carle.com\%2 -p %3 \\%1 -e -h "\\tsupport\tsupload\Cole\Toolset\batch\Actions.cmd"
echo.

set /p prompt=Would you like to run again? (y/n): 
echo.

if %prompt%==y (
	cls
	echo Retrying...
	timeout -t 2 > nul
	goto :start
)

exit