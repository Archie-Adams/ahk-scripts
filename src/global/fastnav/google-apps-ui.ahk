/* -------------------------------------------------------------------------- */
/*                             google-apps-ui.ahk                             */
/* -------------------------------------------------------------------------- */
/*                            Author: Archie Adams                            */
/* -------------------------------------------------------------------------- */
/*          This script adds a GUI to select any Google service via a         */
/*                        hotkey when the GUI is open.                        */
/* -------------------------------------------------------------------------- */
*/

#SingleInstance, force

; ------------------------- Configuration Variables ------------------------  ;
configLoaded = false
#Include *i ../../config/config.ahk
If (%configLoaded% == true) {
  ;; Config loaded correctly.
} else {
  ; Need to use default values.
  googleAppsUi_browser = "chrome.exe"
  googleAppsUi_hotkey = +>+g
}
; --------------------------------------------------------------------------  ;


; ----------------------------------- GUI ----------------------------------  ;
Gui, Margin, 16, 8
Gui, Color, 1d1f21, 282a2e
Gui, +AlwaysOnTop -SysMenu +ToolWindow -caption +Border
Gui, Font, s11 cwhite, Segoe UI
Gui, add, text, x10 y16, Gmail: G
Gui, add, text,, Google Calendar: H
Gui, add, text,, Google Docs: W
Gui, add, text,, Google Sheets: X
Gui, add, text,, Google Slides: S
Gui, add, text,, Google Drive: D
Gui, add, text,, Google Meet: E
Gui, add, text,, Google Chat: C
Gui, add, text,, Google Apps Script: A
Gui, add, text,, Google Forms: F
Gui, add, text,, Google Sites: I
Gui, add, text,, Google Maps: M
Gui, add, text,, Google My Maps: Y
Gui, add, text,, Google Photos: P
Gui, add, text,, Google Chrome: R
Gui, add, text,, Google Translate: T
Gui, add, text,, Google Street View: V
Gui, add, text,, Google Account: Z
Gui, add, text,, Google Password Manager: N
Gui, add, text,, Google Firebase: B
Gui, add, text,, Google Cloud Console: O
Gui, add, text,, Google Currents: U
Gui, add, text,, Google Keep: K
Gui, add, text,, Google Cloud Search: Q
Gui, add, text,, Google Jamboard: J

Gui, Add, Text, w150 0x10  ;Horizontal Line > Etched Gray
Gui, add, text, y+4, New Docs: SHIFT+W
Gui, add, text,, New Sheets: SHIFT+X
Gui, add, text,, New Slides: SHIFT+S
Gui, add, text,, New Drawing: SHIFT+D

Gui, Add, Text, x190 y16 h685 0x11  ;Vertical Line > Etched Gray

Gui, add, text, x210 y16, Google News: ALT+W
Gui, add, text,, Google Books: ALT+B
Gui, add, text,, Google Dataset Search: ALT+D
Gui, add, text,, Google Finance: ALT+N
Gui, add, text,, Google Flights: ALT+F
Gui, add, text,, Google Image Search: ALT+I
Gui, add, text,, Google Scholar: ALT+S
Gui, add, text,, Google Shopping: ALT+P
Gui, add, text,, Google Patents: ALT+A
Gui, add, text,, YouTube: ALT+Y

; TODO: Add chrome:// urls
; --------------------------------------------------------------------------  ;


; --------------------------------- Hotkeys --------------------------------  ;
Hotkey, %googleAppsUi_hotkey%, toggleUi
return
toggleUi:
toggle := !toggle
If toggle
  Gui, Show
else
  Gui, hide
return

;; Hotkeys only work when UI is toggled shown.
#If (toggle)

Esc::
toggle := !toggle
Gui, hide
return

openURL(url)
{
  global toggle
  global googleAppsUi_browser
  Run, %googleAppsUi_browser% %url%
  toggle := !toggle
  Gui, hide
}

A::openURL("https://script.google.com/home/start")
B::openURL("https://console.firebase.google.com/")
C::openURL("https://mail.google.com/chat/u/0/#chat/welcome")
D::openURL("https://drive.google.com/drive/my-drive")
E::openURL("https://meet.google.com/")
F::openURL("https://docs.google.com/forms/u/0/")
G::openURL("https://mail.google.com/mail/u/0/#inbox")
H::openURL("https://calendar.google.com/calendar/u/0/r")
I::openURL("https://sites.google.com/new")
J::openURL("https://jamboard.google.com/")
K::openURL("https://keep.google.com/u/0/")
M::openURL("https://www.google.com/maps")
N::openURL("https://passwords.google.com")
O::openURL("https://console.cloud.google.com/")
P::openURL("https://photos.google.com/")
Q::openURL("https://cloudsearch.google.com/")
R::openURL("chrome://newtab")
S::openURL("https://docs.google.com/presentation/u/0/")
T::openURL("https://translate.google.co.uk/")
U::openURL("https://currents.google.com")
V::openURL("https://www.instantstreetview.com/")
W::openURL("https://docs.google.com/document/u/0/")
X::openURL("https://docs.google.com/spreadsheets/u/0/")
Y::openURL("https://www.google.com/maps/d/u/0/")
Z::openURL("https://myaccount.google.com/")


+S::openURL("https://slides.new")
+W::openURL("https://docs.new")
+X::openURL("https://sheets.new")
+D::openURL("https://docs.google.com/drawings")


!W::openURL("https://news.google.com/")
!B::openURL("https://books.google.com/")
!D::openURL("https://datasetsearch.research.google.com/")
!N::openURL("https://www.google.com/finance/")
!F::openURL("https://www.google.com/flights")
!I::openURL("https://images.google.com/")
!S::openURL("https://scholar.google.com/")
!P::openURL("https://shopping.google.com/")
!Y::openURL("https://www.youtube.com/")
!A::openURL("https://patents.google.com/")

#If
; --------------------------------------------------------------------------  ;