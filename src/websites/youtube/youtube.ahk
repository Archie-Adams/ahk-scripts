; TODO: Update file header.
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

;  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ;
SetCapsLockState, AlwaysOff

; 2 = A window's title can contain WinTitle anywhere inside it to be a match.
SetTitleMatchMode, 2
#if winactive("YouTube ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe")
;  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ;



;  -------------------------------- Help file -------------------------------  ;
>!/::
If (WinActive("help-youtube.html - Google Chrome")) {
  Send, ^w
} Else {
  Run, "help-youtube.html"
}
Return
;  --------------------------------------------------------------------------  ;


;  ----------------------- Window Specific Expansions -----------------------  ;
;  --------------------------------------------------------------------------  ;


;  ------------------------- Window Specific Hotkeys ------------------------  ;
;  --------------------------------------------------------------------------  ;


;  -------------------- CapsLock Window Specific Hotkeys --------------------  ;
;  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ;
#if getkeystate("capslock", "p") && winactive("YouTube ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe")
;  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ;

sendJS(url, js)
{
  temp := clipboardall
  clipboard := %url% %js%
  Send, ^+{Insert}
  clipboard := temp
}

+f::

return

s::
sendJS("", "document.querySelectorAll('[title=""Subscriptions""]')[0].click();")
return

e::
return

h::
return
;  --------------------------------------------------------------------------  ;
#if
#if