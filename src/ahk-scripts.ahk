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
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

Run, ".\google-apps-ui.ahk"

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
#Include programs\chrome\chrome.ahk
#Include programs\vscode\vscode.ahk
;  ---------------------------------------
