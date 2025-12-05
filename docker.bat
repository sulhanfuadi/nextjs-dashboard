@echo off
REM Docker management menu

:menu
cls
echo.
echo ===== NEXTJS DASHBOARD - DOCKER MENU =====
echo.
echo 1. Start Container (with logs)
echo 2. Start Container (background)
echo 3. Stop Container
echo 4. View Logs
echo 5. Rebuild (no cache)
echo 6. Clean Up
echo 7. Exit
echo.

set /p choice="Select option (1-7): "

if "%choice%"=="1" call scripts\docker-start.bat
if "%choice%"=="2" call scripts\docker-start-bg.bat
if "%choice%"=="3" call scripts\docker-stop.bat
if "%choice%"=="4" call scripts\docker-logs.bat
if "%choice%"=="5" call scripts\docker-rebuild.bat
if "%choice%"=="6" call scripts\docker-clean.bat
if "%choice%"=="7" exit

goto menu