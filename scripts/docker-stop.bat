@echo off
REM Docker stop script - Stop and remove containers

echo.
echo ===== NEXTJS DASHBOARD - DOCKER STOP =====
echo.

REM Navigate to project root (one level up from scripts folder)
cd /d "%~dp0.."

echo Stopping containers...
docker-compose down

echo.
echo Container stopped successfully!
echo.

pause