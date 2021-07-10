/* -------------------------------------------------------------------------- */
/*                                template.ahk                                */
/* -------------------------------------------------------------------------- */
/*                            Author: Archie Adams                            */
/*                       Source: https://www.google.com/                      */
/* -------------------------------------------------------------------------- */
/*            This is a short description of what this script does.           */
/*                     It is okay to be a few lines long.                     */
/* -------------------------------------------------------------------------- */
*/

SetCapsLockState, AlwaysOff

; 2 = A window's title can contain WinTitle anywhere inside it to be a match.
SetTitleMatchMode, 2
#ifwinactive Visual Studio Code ahk_class Chrome_WidgetWin_1

;  -------------------------------- Help file -------------------------------  ;
>!/::
If (WinActive("vscode-help.html - Google Chrome")) {
  Send, ^w
} Else {
  Run, "vscode-help.html"
}
Return
;  --------------------------------------------------------------------------  ;


;  --------------------------------------------------------------------------  ;

; Pastes header template.
CapsLock & c::
{
   temp := clipboardall
   clipboard := "/* -------------------------------------------------------------------------- */`n/*                                template.ahk                                */`n/* -------------------------------------------------------------------------- */`n/*                            Author: Archie Adams                            */`n/*                       Source: https://www.google.com/                      */`n/* -------------------------------------------------------------------------- */`n/*            This is a short description of what this script does.           */`n/*                     It is okay to be a few lines long.                     */`n/* -------------------------------------------------------------------------- */`n*/"
   Send, ^v
   clipboard := temp
}
return

/* -------------------------------------------------------------------------- */