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
; BUG: Sometimes in low width windows subscriptions button is not available.
; FIX: Change to href.navigate, or if slower, find the js called by the subscriptions button.
; Could also have code to run one way on >width slower way on <width.
sendJS("youtube.com", "document.querySelectorAll('[title=""Subscriptions""]')[0].click();")
return
;  --------------------------------------------------------------------------  ;