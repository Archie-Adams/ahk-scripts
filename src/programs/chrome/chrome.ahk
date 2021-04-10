; 2 = A window's title can contain WinTitle anywhere inside it to be a match.
SetTitleMatchMode, 2
; #ifwinactive SomeTitle ahk_class SomeClass
#ifwinactive  - Google Chrome ahk_class Chrome_WidgetWin_1

;  -------------------------------- Help file -------------------------------  ;
>!/::
If (WinActive("chrome-help.html - Google Chrome")) {
  Send, ^w
} Else {
  Run, "chrome-help.html"
}
Return
;  --------------------------------------------------------------------------  ;
