@echo off
REM Clean up Docker containers, images, and volumes

echo.
echo ===== NEXTJS DASHBOARD - DOCKER CLEAN =====
echo.

REM Navigate to project root (one level up from scripts folder)
cd /d "%~dp0.."

echo WARNING: This will remove:
echo   - Stopped containers
echo   - Built images
echo   - Docker volumes
echo.

set /p confirm="Continue? (y/n): "
if /i not "%confirm%"=="y" (
    echo Cancelled.
    pause
    exit /b 0
)

echo.
echo Removing containers and volumes...
docker-compose down -v

echo.
echo Removing images...
docker image rm nextjs-dashboard-nextjs 2>nul

echo.
echo Cleanup complete!
echo.

pause