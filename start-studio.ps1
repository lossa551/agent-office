# Agent Office - Game Studio Edition Launcher
$ErrorActionPreference = "Stop"
Set-Location -Path $PSScriptRoot

Write-Host "====================================================" -ForegroundColor Cyan
Write-Host "  Agent Office: Game Studio Edition" -ForegroundColor Yellow
Write-Host "  Powered by Antigravity (Gemini) & Summer Engine" -ForegroundColor Cyan
Write-Host "====================================================" -ForegroundColor Cyan
Write-Host ""

if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Host "[ERROR] Node.js was not found on your PATH. Please install Node.js 20+: https://nodejs.org" -ForegroundColor Red
    pause
    exit 1
}

if (-not (Test-Path "node_modules")) {
    Write-Host "[1/3] Installing dependencies (first run)..." -ForegroundColor Green
    npm install
}

if (-not (Test-Path "dist")) {
    Write-Host "[2/3] Building client and server..." -ForegroundColor Green
    npm run build
}

Write-Host "[3/3] Launching Game Studio on http://localhost:4600..." -ForegroundColor Green
Write-Host "Default Agent: Antigravity (agy)" -ForegroundColor Cyan
Write-Host ""

npm run studio
