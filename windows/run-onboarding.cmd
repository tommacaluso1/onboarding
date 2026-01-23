@echo off
setlocal

REM Simple launcher for the onboarding PowerShell script.
REM Run this as Administrator.

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0onboarding.ps1"

if %errorlevel% neq 0 (
  echo Onboarding failed with exit code %errorlevel%.
  exit /b %errorlevel%
)

echo Onboarding complete.
