/* -------------------------------------------------------------------------- */
/*                               ahk-scripts.ahk                              */
/* -------------------------------------------------------------------------- */
/*                            Author: Archie Adams                            */
/* ----------- Source: https://github.com/Archie-Adams/ahk-scripts ---------- */
/* -------------------------------------------------------------------------- */
/*       This is the main script for the project, it pulls together all       */
/*            other scripts and includes reload and exit shortcuts.           */
/* -------------------------------------------------------------------------- */
*/


#SingleInstance, Force
SetCapsLockState, AlwaysOff
; A window's title can contain WinTitle anywhere inside it to be a match.
SetTitleMatchMode, 2


Run, "global\fastnav\google-apps-ui.ahk"
; Run, "programs\vscode\TEST.ahk"

; TODO: Single config. Perhaps in this file.
; Set include directory
#Include C:\Users\archi\OneDrive\ahk-scripts\src

; expansions -----------------------------
#Include expansions\ascii.ahk
#Include expansions\autocorrect.ahk
#Include expansions\german-umlauts.ahk
#Include expansions\math-expansions.ahk
;  ---------------------------------------


; global shortcuts -----------------------
#Include global\global-shortcuts.ahk
#Include global\AdvancedWindowSnap.ahk
#Include global\instant-program-switches.ahk
#Include global\misc-functions.ahk
;  ---------------------------------------


; program shortcuts ----------------------
; working on own but not parrelal, not within ahk-scripts.
#Include programs\chrome\chrome.ahk
#Include programs\vscode\vscode.ahk
;  ---------------------------------------


; website shortcuts ----------------------
#Include websites\all-websites-temp.ahk
; #Include websites\example-out.ahk
;  ---------------------------------------



; Script reload shortcut.
#If
#>!Enter::
DetectHiddenWindows, On ; Detects the pop up of the non compiled script.
path_google = C:\Users\archi\OneDrive\ahk-scripts\src\global\fastnav\google-apps-ui.ahk
WinClose, %path_google% ahk_class AutoHotkey
Reload
Return

; Script exit shortcut.
#If
#+>!Enter::
DetectHiddenWindows, On ; Detects the pop up of the non compiled script.
path_google = C:\Users\archi\OneDrive\ahk-scripts\src\global\fastnav\google-apps-ui.ahk
WinClose, %path_google% ahk_class AutoHotkey
ExitApp
Return