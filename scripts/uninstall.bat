@echo off
echo === Battery Alert - Uninstall ===
echo.

REM Get the root directory (parent of scripts folder)
set "ROOT_DIR=%~dp0.."

REM Debug info
echo Looking for requirements.txt in: %ROOT_DIR%
if exist "%ROOT_DIR%\requirements.txt" (
    echo Found requirements.txt file
) else (
    echo Could not find requirements.txt file
)
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
    schtasks /delete /tn "Battery Alert Monitor" /f >nul 2>&1
    if %errorLevel% equ 0 (
        echo Task removed successfully!
    ) else (
        echo Failed to remove task. Task might not exist or access was denied.
        pause
        exit /b 1
    )
) else if "%choice%"=="2" (
    if %IS_ADMIN% equ 0 (
        echo Removing scheduled task...
        schtasks /delete /tn "Battery Alert Monitor" /f >nul 2>&1
        if %errorLevel% equ 0 (
            echo Task removed successfully!
        ) else (
            echo Note: Task removal failed. Task might not exist.
        )
    ) else (
        echo Note: Administrator privileges required to remove the task.
        echo The task will not be removed, but packages will be uninstalled.
    )
    
    echo.
    echo Uninstalling packages...
    pip uninstall -y -r "%ROOT_DIR%\requirements.txt"
    if %errorLevel% equ 0 (
        echo Packages uninstalled successfully!
    ) else (
        echo Warning: Some packages might not have been uninstalled properly.
    )
    
    echo.
    echo Note: Project files were not deleted.
    echo You can manually delete the project folder if needed.
) else (
    echo.
    echo Uninstall cancelled.
)

echo.
pause 