@echo off
:menu
cls
echo ============================================
echo Choose an option:
echo 1 - Show current directory
echo 2 - Show RAM details (Total Installed RAM)
echo 3 - Show RAM Type
echo 4 - Show Full RAM Information
echo 5 - Check High RAM Utilizing Applications
echo 6 - Exit
echo ============================================
set /p choice=Enter your choice: 

if "%choice%"=="1" goto dirinfo
if "%choice%"=="2" goto ramtotal
if "%choice%"=="3" goto ramtype
if "%choice%"=="4" goto ramfull
if "%choice%"=="5" goto highram
if "%choice%"=="6" goto exit
goto invalid

:dirinfo
echo.
echo Current Directory:
cd
echo.
pause
goto menu

:ramtotal
echo.
echo Total Installed RAM:
systeminfo | findstr /C:"Total Physical Memory"
echo.
pause
goto menu

:ramtype
echo.
echo RAM Type (SMBIOS Memory Type):
wmic memorychip get SMBIOSMemoryType
echo.
echo (17=DDR, 19=DDR2, 24=DDR3, 26=DDR4, 34=DDR5)
echo.
pause
goto menu

:ramfull
echo.
echo Full RAM Details:
wmic memorychip get Capacity, Manufacturer, MemoryType, Speed, PartNumber, SerialNumber
echo.
pause
goto menu

:highram
echo.
echo Top Processes by RAM usage:
powershell "Get-Process | Sort-Object -Property WorkingSet -Descending | Select-Object -First 10 Name, @{Name='Memory(MB)';Expression={[math]::Round($_.WorkingSet/1MB,2)}}"
echo.
pause
goto menu

:invalid
echo.
echo Invalid choice! Please try again.
pause
goto menu

:exit
echo.
echo Exiting... Goodbye!
timeout /t 1 >nul
exit
