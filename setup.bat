@echo off
echo === Battery Alert Setup ===
echo.

REM Installing required packages
echo Installing required packages...
pip install playsound==1.3.0 psutil==6.1.1

echo.
echo === Configuration ===
echo.
echo Default settings:
echo - Battery target: 93%%
echo - Check interval: 120 seconds (2 minutes)
echo.
echo Press Enter to accept default values, or type a new value:
echo.

REM Get user settings
set /p "battery_percent=Target battery percentage [93]: "
if "%battery_percent%"=="" (
    set battery_percent=93
    echo Using default value: 93%%
)

echo.
set /p "check_interval=Check interval in seconds [120]: "
if "%check_interval%"=="" (
    set check_interval=120
    echo Using default value: 120 seconds
)

REM Update battery_alert.py with new settings
powershell -Command "(Get-Content battery_alert.py) | ForEach-Object { $_ -replace 'TARGET_BATTERY_PERCENT = \d+', 'TARGET_BATTERY_PERCENT = %battery_percent%' } | Set-Content battery_alert.py"
powershell -Command "(Get-Content battery_alert.py) | ForEach-Object { $_ -replace 'CHECK_INTERVAL = \d+', 'CHECK_INTERVAL = %check_interval%' } | Set-Content battery_alert.py"

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
    python battery_alert.py
)

pause 