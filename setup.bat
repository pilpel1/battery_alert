@echo off
echo === Battery Alert Setup ===
echo.

REM התקנת חבילות נדרשות
echo Installing required packages...
pip install playsound==1.3.0 psutil==6.1.1

echo.
echo === Configuration ===
echo.

REM קבלת הגדרות מהמשתמש
set /p battery_percent="Enter target battery percentage [93]: "
if "%battery_percent%"=="" set battery_percent=93

set /p check_interval="Enter check interval in seconds [120]: "
if "%check_interval%"=="" set check_interval=120

REM יצירת קובץ config.py
echo # הגדרות עבור Battery Alert > config.py
echo. >> config.py
echo # אחוז הסוללה שממנו תופעל ההתראה (כשהמחשב מחובר לחשמל) >> config.py
echo TARGET_BATTERY_PERCENT = %battery_percent% >> config.py
echo. >> config.py
echo # זמן בשניות בין בדיקות >> config.py
echo CHECK_INTERVAL = %check_interval% >> config.py

echo.
echo Configuration saved to config.py:
echo - Target Battery: %battery_percent%%%
echo - Check Interval: %check_interval% seconds
echo.
echo === Setup Complete ===
echo.

REM שאלה אם להפעיל את התוכנית
set /p run_now="Would you like to run Battery Alert now? (y/n): "
if /i "%run_now%"=="y" (
    echo.
    echo Starting Battery Alert...
    python battery_alert.py
) else (
    echo.
    echo To run Battery Alert later, use: python battery_alert.py
)

pause 