# ---------------------------------------------------------------------------- #
#                         build-startup-shortcuts.ps1                          #
# ---------------------------------------------------------------------------- #
#                             Author: Archie Adams                             #
# ---------------------------------------------------------------------------- #
#     Creates shortcuts for each ahk file to be put in the startup folder.     #
#          Tempoary measure until combined .exe build script finished.         #
# ---------------------------------------------------------------------------- #

Write-Host "WARNING: $PWD\build\shortcuts will be cleared of all files."
$confirmation = Read-Host "Are you Sure You Want To Proceed"
if ($confirmation -eq 'y') {

  # Delete and remake shortcuts directory.
  Remove-Item "$PWD\build\shortcuts" -Recurse -Force -ErrorAction Ignore
  New-Item -ItemType Directory -Force -Path .\build\shortcuts

  # Create shortcut for each .ahk file in .\src.
  Get-ChildItem -Path ".\src" -Recurse -Filter *.ahk |
  Foreach-Object {
    Write-Host "Creating shortcut for $_"
    $WshShell = New-Object -comObject WScript.Shell
    $ShortcutPath = "$PWD\build\shortcuts\$_".Replace(".ahk", ".lnk")
    $Shortcut = $WshShell.CreateShortcut("$ShortcutPath")
    $Shortcut.TargetPath = $_.FullName
    $Shortcut.Save()
  }

  # Create shortcut for each .html file in .\src.
  Get-ChildItem -Path ".\src" -Recurse -Filter *.html |
  Foreach-Object {
    Write-Host "Creating shortcut for $_"
    $WshShell = New-Object -comObject WScript.Shell
    $ShortcutPath = "$PWD\build\shortcuts\$_".Replace(".html", ".lnk")
    $Shortcut = $WshShell.CreateShortcut("$ShortcutPath")
    $Shortcut.TargetPath = $_.FullName
    $Shortcut.Save()
  }
}