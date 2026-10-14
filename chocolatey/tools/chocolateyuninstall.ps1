$ErrorActionPreference = 'Stop'
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\Snipocket'
if (-not (Test-Path $key)) { Write-Warning 'Snipocket is not registered for the current Windows user.'; return }
$entry = Get-ItemProperty $key
$uninstaller = Join-Path $entry.InstallLocation 'uninstall.exe'
if (-not (Test-Path $uninstaller)) { throw 'Registered Snipocket uninstaller is missing.' }
Uninstall-ChocolateyPackage -PackageName $env:ChocolateyPackageName -FileType 'exe' -SilentArgs '/S' -File $uninstaller -ValidExitCodes @(0)
# NSIS can finish through a child process after its launcher has returned.
$deadline = (Get-Date).AddSeconds(60)
while ((Test-Path $key) -and (Get-Date) -lt $deadline) { Start-Sleep -Milliseconds 500 }
if (Test-Path $key) { throw 'Snipocket uninstall did not finish within 60 seconds.' }
