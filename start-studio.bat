@echo off
title Agent Office - Game Studio Edition
cd /d "%~dp0"

echo ====================================================
echo   Agent Office: Game Studio Edition
echo   Powered by Antigravity (Gemini) ^& Summer Engine
echo ====================================================
echo.

where node >nul 2>nul
if %errorlevel% neq 0 (
  echo [ERROR] Node.js was not found on your PATH.
  echo Please install Node.js 20+: https://nodejs.org
  pause
  exit /b 1
)

if not exist node_modules (
  echo [1/3] Installing dependencies (first run)...
  call npm install
  if %errorlevel% neq 0 (
    echo [ERROR] npm install failed.
    pause
    exit /b 1
  )
)

if not exist dist (
  echo [2/3] Building client and server...
  call npm run build
  if %errorlevel% neq 0 (
    echo [ERROR] Build failed.
    pause
    exit /b 1
  )
)

echo [3/3] Launching Game Studio on http://localhost:4600...
echo Default Agent: Antigravity (agy)
echo.
call npm run studio
pause
