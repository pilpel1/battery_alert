@echo off
echo === Battery Alert - Uninstall ===
echo.

REM Check for admin privileges for task removal
net session >nul 2>&1
set "IS_ADMIN=%errorLevel%"

echo Select an option:
echo 1. Remove scheduled task only (requires admin privileges)
echo 2. Complete uninstall (removes task and uninstalls packages)
echo 3. Cancel
echo.
set /p "choice=Enter your choice (1-3): "

if "%choice%"=="1" (
    if %IS_ADMIN% neq 0 (
        echo Administrator privileges required to remove the task.
        echo Please run this script as administrator.
        pause
        exit /b 1
    )
    echo Removing scheduled task...
    schtasks /delete /tn "Battery Alert Monitor" /f
    if %errorLevel% equ 0 (
        echo Task removed successfully!
    ) else (
        echo Task not found or already removed.
    )
) else if "%choice%"=="2" (
    if %IS_ADMIN% neq 0 (
        echo Note: Administrator privileges required to remove the task.
        echo The task might not be removed, but packages will be uninstalled.
    ) else (
        echo Removing scheduled task...
        schtasks /delete /tn "Battery Alert Monitor" /f >nul 2>&1
    )
    
    echo.
    echo Uninstalling packages...
    cd ..
    pip uninstall -y -r requirements.txt
    
    echo.
    echo Packages uninstalled successfully!
    echo Note: Project files were not deleted.
    echo You can manually delete the project folder if needed.
) else (
    echo.
    echo Uninstall cancelled.
)

echo.
pause 