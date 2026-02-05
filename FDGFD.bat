@echo off
title Windows Deep Cleaner
color 0A


echo  _____            __  __ _____________   __   _____ _      ______          _   _ ______ _____
echo ^|  __ \     /\   ^|  \/  ^|___  /_   _\ \ / /  ^| ____^| ^|    ^|  ____^|   /\   ^| \ ^| ^|  ____^|  __ \
echo  RAMZIX CLEANER PC BAYPASS ECHO / OCEN
echo ^|  _  /   / /\ \ ^| ^|\/^| ^| / /   ^| ^|   ^> <    ^| ^|    ^| ^|    ^|  __^|   / /\ \ ^| . ` ^|  __^| ^|  _  /
echo ^| ^| \ \  / ____ \^| ^|  ^| ^|/ /__ _^| ^|_ / . \   ^| ^|____^| ^|____^| ^|____ / ____ \^| ^|\  ^| ^|____^| ^| \ \
echo ^|_^|  \_\/_/    \_\_^|  ^|_/_____^|_____^|_/ \_\   \_____^|______^|______/_/    \_\_^| \_^|______^|_^|  \_\
echo.


:: Clean TEMP
echo Cleaning TEMP...
del /s /f /q %temp%\* >nul 2>&1
rd /s /q %temp% >nul 2>&1
md %temp% >nul 2>&1

del /s /f /q C:\Windows\Temp\* >nul 2>&1

:: Clean Crash Dumps
echo Cleaning Crash Dumps...
del /f /q C:\Windows\Minidump\* >nul 2>&1
del /f /q C:\Windows\MEMORY.DMP >nul 2>&1


del /s /f /q %temp%\* >nul 2>&1
rd /s /q %temp% >nul 2>&1
md %temp%
del /s /f /q C:\Windows\Temp\* >nul 2>&1

:: ================= PREFETCH =================
del /s /f /q C:\Windows\Prefetch\* >nul 2>&1

:: ================= RECENT / RECENTDOCS =================
del /s /f /q "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1

:: ================= JUMP LISTS =================
del /s /f /q "%APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*" >nul 2>&1
del /s /f /q "%APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*" >nul 2>&1

:: ================= USER ASSIST =================
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f >nul 2>&1

:: ================= MUI CACHE =================
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f >nul 2>&1

:: ================= SHELLBAGS =================
reg delete "HKCU\Software\Microsoft\Windows\Shell\BagMRU" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\Shell\Bags" /f >nul 2>&1

:: ================= AMCACHE / APPCOMPAT =================
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\AppCompatCache" /f >nul 2>&1
del /s /f /q C:\Windows\AppCompat\Programs\* >nul 2>&1

:: ================= WINDOWS SEARCH =================
del /s /f /q "%LOCALAPPDATA%\Microsoft\Windows\History\*" >nul 2>&1

:: ================= CRASH DUMPS =================
del /s /f /q C:\Windows\Minidump\* >nul 2>&1
del /s /f /q C:\Windows\MEMORY.DMP >nul 2>&1

:: ================= DNS =================
ipconfig /flushdns >nul

:: ================= EVENT LOGS =================
for /F "tokens=*" %%G in ('wevtutil el') do wevtutil cl "%%G"

:: ================= POWERSHELL HISTORY =================
del /s /f /q "%APPDATA%\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" >nul 2>&1

:: ================= REGEDIT HISTORY =================
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit" /v LastKey /f >nul 2>&1

:: ================= DEFENDER HISTORY (SAFE) =================
del /s /f /q "%ProgramData%\Microsoft\Windows Defender\Scans\History\*" >nul 2>&1

:: ================= NVIDIA CACHE =================
del /s /f /q "%LOCALAPPDATA%\NVIDIA\*" >nul 2>&1
del /s /f /q "%APPDATA%\NVIDIA\*" >nul 2>&1

:: ================= DATA USAGE =================
del /s /f /q "%LOCALAPPDATA%\Microsoft\Windows\WER\*" >nul 2>&1

:: ================= BROWSER HISTORY =================
del /s /f /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\History" >nul 2>&1
del /s /f /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\History" >nul 2>&1

:: ================= STEAM =================
del /s /f /q "%ProgramFiles(x86)%\Steam\config\loginusers.vdf" >nul 2>&1

:: ================= WINDOWS UPDATE CACHE =================
net stop wuauserv >nul
rd /s /q C:\Windows\SoftwareDistribution >nul 2>&1
net start wuauserv >nul


:: Clean Event Logs
echo Cleaning Event Logs...
for /F "tokens=*" %%G in ('wevtutil el') do wevtutil cl "%%G" >nul 2>&1

:: Clean Registry MRU
echo Cleaning Registry MRU...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f >nul 2>&1

:: Clean Icon Cache
echo Cleaning Icon Cache...
taskkill /f /im explorer.exe >nul 2>&1
del /a /f /q "%localappdata%\IconCache.db" >nul 2>&1
del /a /f /q "%localappdata%\Microsoft\Windows\Explorer\iconcache*" >nul 2>&1
start explorer.exe

:: Clean Recycle Bin
echo Cleaning Recycle Bin...
rd /s /q C:\$Recycle.Bin >nul 2>&1

:: Clean Windows Search
echo Cleaning Windows Search Cache...
net stop "Windows Search" >nul 2>&1
rd /s /q "C:\ProgramData\Microsoft\Search\Data\Applications\Windows" >nul 2>&1
net start "Windows Search" >nul 2>&1

:: Clean USB History
echo Cleaning USB History...
reg delete HKLM\SYSTEM\CurrentControlSet\Enum\USBSTOR /f >nul 2>&1

:: Clean PowerShell History
echo Cleaning PowerShell History...
del /f /q "%APPDATA%\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" >nul 2>&1

:: Clean Prefetch
echo Cleaning Prefetch...
del /f /q C:\Windows\Prefetch\* >nul 2>&1

:: Clean Recent Files
echo Cleaning Recent Files...
del /f /q "%APPDATA%\Microsoft\Windows\Recent\*" >nul 2>&1

:: Clean Chrome & Edge Cache
echo Cleaning Chrome & Edge Cache...
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" >nul 2>&1
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" >nul 2>&1

:: Clean Clipboard
echo Cleaning Clipboard...
echo off | clip

:: Clean Thumbnails
echo Cleaning Thumbnails...
del /f /s /q "%LOCALAPPDATA%\Microsoft\Windows\Explorer\thumbcache*" >nul 2>&1

:: Flush DNS
echo Flushing DNS...
ipconfig /flushdns >nul 2>&1

:: Clean Windows Defender History
echo Cleaning Defender History...
rd /s /q "C:\ProgramData\Microsoft\Windows Defender\Scans\History" >nul 2>&1

:: Clean Windows Update Cache
echo Cleaning Windows Update Cache...
net stop wuauserv >nul 2>&1
rd /s /q C:\Windows\SoftwareDistribution >nul 2>&1
net start wuauserv >nul 2>&1

:: Clean Windows Logs
echo Cleaning Windows Logs...
del /f /q C:\Windows\Logs\* >nul 2>&1

echo.
echo ===============================
echo   CLEANING FINISHED ✔
echo ===============================
echo.
pause
exit
