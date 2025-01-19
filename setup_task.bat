@echo off
echo === Battery Alert Task Scheduler Setup ===
echo.

REM Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script requires administrator privileges.
    echo Please right-click and select "Run as administrator"
    echo.
    pause
    exit /b 1
)

echo This script will set up Battery Alert to run automatically when Windows starts.
echo The program will check your battery every 5 minutes when connected to power.
echo.
echo Current settings from config.py will be used.
echo.

set "SCRIPT_PATH=%~dp0battery_alert.py"
set "PYTHON_PATH=python"

echo Checking Python installation...
python --version >nul 2>&1
if %errorLevel% neq 0 (
    echo Python not found in PATH
    echo Please make sure Python is installed and added to PATH
    pause
    exit /b 1
)

echo.
echo Task configuration:
echo - Name: Battery Alert Monitor
echo - Trigger: At system startup
echo - Repeat: Every 5 minutes
echo - Run only when on AC power
echo.
set /p "confirm=Continue with installation? (Press Enter for Yes, or 'n' for No): "
if /i "%confirm%"=="n" (
    echo Setup cancelled.
    pause
    exit /b 0
)

echo.
echo Creating scheduled task...

REM Delete existing task if it exists
schtasks /delete /tn "Battery Alert Monitor" /f >nul 2>&1

REM Create new task
schtasks /create /tn "Battery Alert Monitor" /tr "python \"%SCRIPT_PATH%\"" /sc onstart /ru "%USERNAME%" /rl highest /f

if %errorLevel% equ 0 (
    echo.
    echo Task created successfully!
    echo Battery Alert will now start automatically with Windows.
    echo You can manage this task in Task Scheduler under the name "Battery Alert Monitor"
) else (
    echo.
    echo Failed to create task. Error code: %errorLevel%
    echo Please try setting up the task manually using Task Scheduler
)

echo.
echo Note: You can still run the program manually using: python battery_alert.py
echo.
pause 