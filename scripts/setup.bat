@echo off
setlocal enabledelayedexpansion

REM Get the directory where the script is located
set "SCRIPT_DIR=%~dp0"
cd "%SCRIPT_DIR%"
cd ..
set "ROOT_DIR=%CD%"
cd "%SCRIPT_DIR%"

echo === Battery Alert Setup ===
echo.

REM Installing required packages
echo Installing required packages...
cd ..
pip install -r requirements.txt

REM Read current values from battery_alert.py
for /f "tokens=3" %%a in ('findstr /C:"TARGET_BATTERY_PERCENT = " "%ROOT_DIR%\battery_alert.py"') do set current_battery=%%a
for /f "tokens=3" %%a in ('findstr /C:"CHECK_INTERVAL = " "%ROOT_DIR%\battery_alert.py"') do set current_interval=%%a

echo.
echo === Configuration ===
echo.
echo Current settings:
echo - Battery target: %current_battery%%%
echo - Check interval: %current_interval% seconds
echo.
echo Press Enter to keep current values, or type a new value:
echo.

REM Get user settings
set /p "battery_percent=Target battery percentage [%current_battery%]: "
if "%battery_percent%"=="" (
    set battery_percent=%current_battery%
    echo Keeping current value: %current_battery%%%
)

echo.
set /p "check_interval=Check interval in seconds [%current_interval%]: "
if "%check_interval%"=="" (
    set check_interval=%current_interval%
    echo Keeping current value: %current_interval% seconds
)

REM Update battery_alert.py with new settings using absolute path constructed from relative position
powershell -Command "(Get-Content '%ROOT_DIR%\battery_alert.py') | ForEach-Object { $_ -replace 'TARGET_BATTERY_PERCENT = \d+', 'TARGET_BATTERY_PERCENT = %battery_percent%' } | Set-Content '%ROOT_DIR%\battery_alert.py'"
powershell -Command "(Get-Content '%ROOT_DIR%\battery_alert.py') | ForEach-Object { $_ -replace 'CHECK_INTERVAL = \d+', 'CHECK_INTERVAL = %check_interval%' } | Set-Content '%ROOT_DIR%\battery_alert.py'"

echo.
echo Configuration saved:
echo - Target Battery: %battery_percent%%% (Alert will trigger when battery reaches this level)
echo - Check Interval: %check_interval% seconds (Time between checks)
echo.
echo === Setup Complete ===
echo.

REM Ask to run the program
echo Would you like to run Battery Alert now?
echo Press Enter for Yes, or type 'n' for No:
set /p "run_now=[Y]: "
if /i "%run_now%"=="n" (
    echo.
    echo To run Battery Alert later, use: python battery_alert.py
) else (
    echo.
    echo Starting Battery Alert...
    python "%ROOT_DIR%\battery_alert.py"
)

endlocal
pause 