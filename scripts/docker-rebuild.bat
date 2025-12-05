@echo off
REM Rebuild Docker image from scratch without cache

echo.
echo ===== NEXTJS DASHBOARD - REBUILD =====
echo.

REM Navigate to project root (one level up from scripts folder)
cd /d "%~dp0.."

docker ps >nul 2>&1
if errorlevel 1 (
    echo ERROR: Docker is not running. Please start Docker Desktop first.
    pause
    exit /b 1
)

echo Stopping existing containers...
docker-compose down

echo.
echo Rebuilding image without cache...
docker-compose build --no-cache

if errorlevel 1 (
    echo ERROR: Build failed!
    pause
    exit /b 1
)

echo.
echo Starting container...
docker-compose up -d

echo.
echo Rebuild complete!
echo Application URL: http://localhost:3000
echo.

pause