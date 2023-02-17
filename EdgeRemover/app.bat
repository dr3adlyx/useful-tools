@echo off
REM Get the current version of Microsoft Edge installed on the system
REM echo Getting the current version of Microsoft Edge.
REM for /f "tokens=2 delims==" %%I in ('wmic datafile where "name like '%%MicrosoftEdgeUpdate.exe'" get version /value') do set "EdgeVersion=%%I"
REM Disabled the automatic search since its not really working.

REM Change directory to the Edge installer location
echo Changing to Edges Direction.
cd /d "%PROGRAMFILES(X86)%\Microsoft\Edge\Application\110.0.1587.46\Installer"

REM Uninstall Microsoft Edge with setup command
echo Killing Edge.
start /wait cmd /c "setup --uninstall --force-uninstall --system-level"

REM Create a registry key and a DWORD value to prevent automatic updates to Microsoft Edge with Chromium
echo "Disabling automatic updates."
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\EdgeUpdate" /v "DoNotUpdateToEdgeWithChromium" /t REG_DWORD /d 1 /f

REM Flash the window blue
color 1f
timeout 1
color
echo Done!

