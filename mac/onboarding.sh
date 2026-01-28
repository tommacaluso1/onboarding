#!/usr/bin/env bash
set -euo pipefail

section() {
  echo ""
  echo "=== $1 ==="
}

section "Checking Homebrew"
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)" || true
fi

section "Installing apps"
# Chrome
brew install --cask google-chrome

# Google Drive
brew install --cask google-drive

# Microsoft 365 Apps
brew install --cask microsoft-word microsoft-excel microsoft-powerpoint microsoft-outlook

# Microsoft Teams
brew install --cask microsoft-teams

# Slack
brew install --cask slack

# Dialpad
brew install --cask dialpad

section "Completed"
echo "All apps installed. User sign-in will be required at first launch."
