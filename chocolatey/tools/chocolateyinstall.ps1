$ErrorActionPreference = 'Stop'
$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  fileType = 'exe'
  url64bit = 'https://snipocket.com/download/Snipocket-Setup-1.1.0.exe'
  checksum64 = '76B828E6C4C449D8C35653CBAA6BD99474F3106DF70CBEFECD8D3B70134102C1'
  checksumType64 = 'sha256'
  silentArgs = '/S'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
