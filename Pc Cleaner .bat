
@echo off
color 0C
title تنظيف البيسي - By RAMZIX

echo جاري تنظيف الملفات المؤقتة...
del /s /f /q %temp%\*
del /s /f /q C:\Windows\Temp\*
del /s /f /q C:\Windows\Prefetch\*

echo.
echo تنظيف سلة المهملات...
PowerShell.exe -Command "Clear-RecycleBin -Force"

echo.
echo تنظيف الـ DNS Cache...
ipconfig /flushdns

echo.
echo تنظيف ذاكرة المستكشف...
taskkill /f /im explorer.exe
start explorer.exe

echo.
echo تنظيف Windows Update Cache...
net stop wuauserv
del /q /f /s %windir%\SoftwareDistribution\Download\*
net start wuauserv

echo.
echo تم التنظيف بنجاح! 💥
pause
