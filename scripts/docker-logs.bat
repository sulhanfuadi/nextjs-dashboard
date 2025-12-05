@echo off
REM View Docker container logs in real-time

echo.
echo ===== NEXTJS DASHBOARD - LOGS =====
echo.
echo Showing logs (Ctrl+C to exit)...
echo.

REM Navigate to project root (one level up from scripts folder)
cd /d "%~dp0.."

docker-compose logs -f nextjs