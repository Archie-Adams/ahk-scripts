; TODO: Find a way to interface with vscode keyboard shortcuts.
; IDEA: Potentially a vscode extension.
; IDEA: VSCode is chrome based so maybe chrome.ahk works?
/* -------------------------------------------------------------------------- */
/*                                 vscode.ahk                                 */
/* -------------------------------------------------------------------------- */
/*                            Author: Archie Adams                            */
/* -------------------------------------------------------------------------- */
/*          This script defines hotkeys and expansions available when         */
/*                              vscode is active.                             */
/* -------------------------------------------------------------------------- */
*/

;  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ;
SetCapsLockState, AlwaysOff

; 2 = A window's title can contain WinTitle anywhere inside it to be a match.
SetTitleMatchMode, 2
#ifwinactive Visual Studio Code ahk_class Chrome_WidgetWin_1
;  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ;


;  -------------------------------- Help file -------------------------------  ;
>!/::
If (WinActive("vscode-help.html - Google Chrome")) {
  Send, ^w
} Else {
  Run, "vscode-help.html"
}
Return
;  --------------------------------------------------------------------------  ;


;  ----------------------- Window Specific Expansions -----------------------  ;
::TOOD::TODO
::TD::TODO
;  --------------------------------------------------------------------------  ;


;  ------------------------- Window Specific Hotkeys ------------------------  ;
;  --------------------------------------------------------------------------  ;


;  -------------------- CapsLock Window Specific Hotkeys --------------------  ;
;  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ;
#if getkeystate("capslock", "p") && winactive("Visual Studio Code ahk_class Chrome_WidgetWin_1")
;  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ;

; Pastes header template.
; BUG: Sometimes pastes normal clipboard on first or second ativation after
; file loading.
c::
{
  temp := clipboardall
  clipboard := "/* -------------------------------------------------------------------------- */`n/*                                template.ahk                                */`n/* -------------------------------------------------------------------------- */`n/*                            Author: Archie Adams                            */`n/*                       Source: https://www.google.com/                      */`n/* -------------------------------------------------------------------------- */`n/*            This is a short description of what this script does.           */`n/*                     It is okay to be a few lines long.                     */`n/* -------------------------------------------------------------------------- */`n*/"
  Send, ^v
  clipboard := temp
}
return

+c::msgbox, hello
;  --------------------------------------------------------------------------  ;