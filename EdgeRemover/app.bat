@echo off
REM Get the current version of Microsoft Edge installed on the system
REM echo Getting the current version of Microsoft Edge.
REM for /f "tokens=2 delims==" %%I in ('wmic datafile where "name like '%%MicrosoftEdgeUpdate.exe'" get version /value') do set "EdgeVersion=%%I"
REM Disabled the automatic search since its not really working.

echo "Welcome to LYXs EdgeKiller!"
echo "Version 1_102_2."
timeout 2

color 1f
echo Section 1:

REM Change directory to the Edge installer location
echo Changing to Edges Directory.
cd /d "%PROGRAMFILES(X86)%\Microsoft\Edge\Application\110.0.1587.49\Installer"

color 2f
echo Section 2:

REM Uninstall Microsoft Edge with setup command
echo Killing Edge.
start /wait cmd /c "setup --uninstall --force-uninstall --system-level"

color 3f
echo Finalizing...

REM Create a registry key and a DWORD value to prevent automatic updates to Microsoft Edge with Chromium
echo Disabling automatic updates.
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\EdgeUpdate" /v "DoNotUpdateToEdgeWithChromium" /t REG_DWORD /d 1 /f

REM Flash the window !

echo Done! Exiting in 3 seconds.

timeout 3
exit
