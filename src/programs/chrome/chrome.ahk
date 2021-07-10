SetCapsLockState, AlwaysOff


; 2 = A window's title can contain WinTitle anywhere inside it to be a match.
SetTitleMatchMode, 2
; #ifwinactive SomeTitle ahk_class SomeClass
#ifwinactive  - Google Chrome ahk_class Chrome_WidgetWin_1

;  -------------------------------- Help file -------------------------------  ;
; TODO: Add notice to user that ctrl + RALT + / is tab specific help file.
>!/::
If (WinActive("chrome-help.html - Google Chrome")) {
  Send, ^w
} Else {
  Run, "chrome-help.html"
}
Return
;  --------------------------------------------------------------------------  ;