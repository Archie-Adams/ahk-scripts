toggle_powershell() {
  SetTitleMatchMode 2
  IfWinNotExist, Windows PowerShell
  {
    run powershell.exe -command "wsl; cd ~"
  }
  else
  {
    If WinExist, Windows PowerShell ; BUG: Dosent work.
    {
      WinActivate, Windows PowerShell
      Return
    }
    winclose, Windows PowerShell
  }
}

; TODO: same for vscode
switchToChrome()
{
IfWinNotExist, ahk_exe chrome.exe
  Run, chrome.exe

if WinActive("ahk_exe chrome.exe")
  Sendinput ^{tab}
else
  WinActivate ahk_exe chrome.exe
}

switchToExplorer() {
  IfWinNotExist, ahk_class CabinetWClass
    Run, explorer.exe
  GroupAdd, taranexplorers, ahk_class CabinetWClass
  if WinActive("ahk_exe explorer.exe")
    GroupActivate, taranexplorers, r
  else
    ; you have to use WinActivatebottom if you didn't create a window group.
    WinActivate ahk_class CabinetWClass
}

; FIXME: Shouldn't this ideally close all explorers?
closeAllExplorers() {
  WinClose, ahk_group taranexplorers
}

switchWordWindow() {
; Process, Exist, WINWORD.EXE
; ;msgbox errorLevel `n%errorLevel%
  ; If errorLevel = 0
    ; Run, WINWORD.EXE
  ; else
  ; {
  GroupAdd, taranwords, ahk_class OpusApp
  if WinActive("ahk_class OpusApp")
    GroupActivate, taranwords, r
  else
    WinActivate ahk_class OpusApp
  ; }
}
