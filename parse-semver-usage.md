

```powershell
if ($env:APPVEYOR_REPO_TAG -eq "true") {

  $verProps = Parse-SemVer $env:APPVEYOR_REPO_TAG_NAME

  $env:APPVEYOR_BUILD_SEMVER = $verProps.SemVer
  $env:APPVEYOR_BUILD_VERSION = $verProps.Version
  $env:APPVEYOR_BUILD_VERSION_PREID = $verProps.PreId
  Update-AppveyorBuild -Version $ver        
}
elseif([System.String]::IsNullOrEmpty($env:APPVEYOR_PULL_REQUEST_NUMBER) -eq $true) {
  $ver = $env:APPVEYOR_BUILD_VERSION
  $commit = $env:APPVEYOR_REPO_COMMIT.substring(0,7)
  $verInfo = "$ver-$commit"

  Update-AppveyorBuild -Version "$ver-$commit"
  $env:APPVEYOR_BUILD_SEMVER = $verInfo
}

write-host ""
write-host "tag:$env:APPVEYOR_REPO_TAG tag_name:$env:APPVEYOR_REPO_TAG_NAME"
write-host "      APPVEYOR_BUILD_VERSION=$env:APPVEYOR_BUILD_VERSION"
write-host "       APPVEYOR_BUILD_SEMVER=$env:APPVEYOR_BUILD_SEMVER"
write-host "APPVEYOR_BUILD_VERSION_PREID=$env:APPVEYOR_BUILD_VERSION_PREID"
```
