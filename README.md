# Onboarding Automation (Windows + macOS)

This repo provides a beginner-friendly starting point for **unattended device onboarding** on both Windows and macOS. It includes:

- A recommended **zero/low-code path** (Intune + Autopilot for Windows, Intune + Apple Business Manager for macOS)
- **Fallback scripts** for manual/remote runs when MDM is not possible
- Notes on **SSO/logins** and realistic expectations

> These scripts are intended for *initial setup and app installation*. They do **not** bypass MFA or SSO. Use them alongside your identity provider (Microsoft Entra ID / Google Workspace) for secure sign-in.

## Recommended (Unattended) Path

### Windows (Microsoft 365 Business Premium)
Use **Windows Autopilot + Intune**:
1. Register devices in Autopilot.
2. Assign an Autopilot profile (self-deploying or user-driven).
3. Create an Intune device configuration + compliance policy.
4. Deploy apps via Intune:
   - Microsoft 365 Apps (built-in)
   - Microsoft Teams (new Teams)
   - Google Chrome
   - Google Drive
   - Slack
   - Dialpad

**Why this is easiest:** no custom scripts, reliable installs, and device resets are supported from the cloud.

### macOS
Use **Apple Business Manager (ABM) + Intune (or another MDM)**:
1. Enroll Macs into ABM.
2. Assign to Intune (or preferred MDM).
3. Configure Automated Device Enrollment (ADE).
4. Deploy apps via MDM:
   - Microsoft 365 Apps (Word/Excel/PowerPoint/Outlook)
   - Teams
   - Chrome
   - Google Drive
   - Slack
   - Dialpad

**Why this is easiest:** no custom scripts, zero-touch provisioning, and consistent compliance.

## Fallback Scripts (Manual/Remote)
If you cannot use MDM yet, use the scripts in this repo.

- **Windows:** `windows/onboarding.ps1`
- **macOS:** `mac/onboarding.sh`

These scripts install apps unattended and can be run remotely (e.g., AnyDesk/TeamViewer/Remote Help).

### Notes on Logins / SSO
- **Unattended logins are intentionally difficult** due to MFA and security controls.
- Recommended path: **SSO with Microsoft Entra ID + Google Workspace**.
- For apps that support it, deploy **SSO extensions** or **pre-configure** via MDM.

## How to Use

### Windows (easy “double‑click” option)
1. Copy the **entire** `windows/` folder to the device.
2. Right‑click `run-onboarding.cmd` → **Run as administrator**.

This launcher runs the PowerShell script for you. If you prefer manual PowerShell:
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
.\onboarding.ps1
```

### macOS (easy “double‑click” option)
1. Copy the **entire** `mac/` folder to the device.
2. Double‑click `Onboarding.command`.

If macOS blocks it, right‑click → **Open** and confirm. You can also run it in Terminal:
```bash
chmod +x ./onboarding.sh ./Onboarding.command
./Onboarding.command
```

## Support
If you want, I can:
- Customize these scripts for your organization
- Convert them into **Intune app deployments**
- Add company branding and device naming rules
