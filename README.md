# Snipocket packages

Package sources for Snipocket's listings on community package managers.
This repository contains packaging metadata and install scripts only — **no application source code**.

| Package manager | Package | Source |
|---|---|---|
| Chocolatey | [community.chocolatey.org/packages/snipocket](https://community.chocolatey.org/packages/snipocket) | [`chocolatey/`](chocolatey/) |
| WinGet | `Snipocket.Snipocket` | maintained in [microsoft/winget-pkgs](https://github.com/microsoft/winget-pkgs) |
| Homebrew | `brew install --cask testouyang/snipocket/snipocket` | [testouyang/homebrew-snipocket](https://github.com/testouyang/homebrew-snipocket) |

## Chocolatey package

- Downloads the official, versioned installer from snipocket.com (for example `https://snipocket.com/download/Snipocket-Setup-1.1.0.exe`) and verifies its SHA-256 checksum before installing. The package itself contains no binaries.
- Installs for the Windows account that runs Chocolatey (per-user, no administrator rights), exactly like the official installer. Snipocket's built-in updater relies on this per-user install location to update silently without a UAC prompt, so the package keeps the same install scope.
- Silent install uses `/S`. Uninstall runs the registered uninstaller silently and waits for it to finish.

Website: https://snipocket.com/
