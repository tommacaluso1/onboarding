# Onboarding script for Windows 10/11
# Installs: Google Chrome, Google Drive, Microsoft 365 Apps, Microsoft Teams, Slack, Dialpad
# Requires: PowerShell 5+ and winget

$ErrorActionPreference = 'Stop'

function Write-Section($Message) {
    Write-Host "" 
    Write-Host "=== $Message ===" -ForegroundColor Cyan
}

Write-Section "Checking winget"
$winget = Get-Command winget -ErrorAction SilentlyContinue
if (-not $winget) {
    Write-Host "winget not found. Please install App Installer from Microsoft Store." -ForegroundColor Red
    exit 1
}

Write-Section "Installing apps"
# Chrome
winget install --id Google.Chrome --exact --silent --accept-package-agreements --accept-source-agreements

# Google Drive
winget install --id Google.Drive --exact --silent --accept-package-agreements --accept-source-agreements

# Microsoft 365 Apps
# This uses Microsoft 365 Apps for enterprise
winget install --id Microsoft.Office --exact --silent --accept-package-agreements --accept-source-agreements

# Microsoft Teams (new Teams)
winget install --id Microsoft.Teams --exact --silent --accept-package-agreements --accept-source-agreements

# Slack
winget install --id SlackTechnologies.Slack --exact --silent --accept-package-agreements --accept-source-agreements

# Dialpad
winget install --id Dialpad.Dialpad --exact --silent --accept-package-agreements --accept-source-agreements

Write-Section "Completed"
Write-Host "All apps installed. User sign-in will be required at first launch." -ForegroundColor Green
