@echo off
REM Docker start script - Run container in background

echo.
echo ===== NEXTJS DASHBOARD - DOCKER START (BACKGROUND) =====
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
echo Starting container in background...
docker-compose up -d

if errorlevel 0 (
    echo.
    echo ===== Container Started Successfully! =====
    echo Application URL: http://localhost:3000
    echo.
    echo Container Status:
    docker-compose ps
    echo.
    echo Commands:
    echo   View logs: docker-compose logs -f nextjs
    echo   Stop container: docker-compose down
    echo.
)

pause