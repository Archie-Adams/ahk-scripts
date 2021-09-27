
SetCapsLockState, AlwaysOff

;  --------------------- CapsLock Tab Specific Hotkeys ----------------------  ;
;  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ;
; FIXME: only works with chrome.exe?
#if getkeystate("capslock", "p") && winactive("ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe")
;  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ;

; BUG: On first time file load browser receives origanal clipboard.
sendJS(url, js)
{
  temp := clipboardall
  payload := url "~|sep|~" js
  clipboard := payload
  Send, ^+{Insert}
  clipboard := temp
}

N::
sendJS("linkedin.com", "document.querySelectorAll('[data-test-global-nav-link=""mynetwork""]')[0].click();")
return
S::
sendJS("youtube.com", "document.querySelectorAll('[title=""Subscriptions""]')[0].click();")
return
