@echo off
echo === Battery Alert - Quick Startup Configuration ===
echo.

REM Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Administrator privileges required.
    echo Please run this script as administrator.
    pause
    exit /b 1
)

echo Creating scheduled task...
schtasks /create /tn "Battery Alert Monitor" /tr "pythonw.exe %~dp0..\battery_alert.py" /sc ONEVENT /ec Microsoft-Windows-Power-Troubleshooter /mo "*[System[Provider[@Name='Microsoft-Windows-Power-Troubleshooter'] and EventID=1]]" /f >nul 2>&1

if %errorLevel% equ 0 (
    echo Task created successfully!
    echo The program will now start automatically when you plug in your laptop.
    echo Note: The task checks every 5 minutes if the laptop is plugged in.
) else (
    echo Failed to create task. Please check your permissions or try again.
    pause
    exit /b 1
)

echo.
pause 