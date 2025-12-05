@echo off
REM Docker start script - Run container in foreground with logs

echo.
echo ===== NEXTJS DASHBOARD - DOCKER START =====
echo.

REM Navigate to project root (one level up from scripts folder)
cd /d "%~dp0.."

docker ps >nul 2>&1
if errorlevel 1 (
    echo ERROR: Docker is not running. Please start Docker Desktop first.
    pause
    exit /b 1
)

echo Building Docker image...
docker-compose build

if errorlevel 1 (
    echo ERROR: Build failed!
    pause
    exit /b 1
)

echo.
echo Build successful! Starting container...
echo.
echo Application URL: http://localhost:3000
echo Press Ctrl+C to stop
echo.

docker-compose up

pause