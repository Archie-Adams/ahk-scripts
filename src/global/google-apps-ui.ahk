#SingleInstance, force

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
Gui, Font, strike
Gui, add, text,, Google Currents: U
Gui, Font, norm
Gui, add, text,, Google Keep: K
Gui, Font, strike
Gui, add, text,, Google Cloud Search: Q
Gui, Font, norm
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

+>+g::
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

openURL(url, ByRef toggle)
{
  ;; TODO: Add browser config option.
  Run, chrome.exe %url%
  toggle := !toggle
  Gui, hide
}

A::openURL("https://script.google.com/home/start", toggle)
B::openURL("https://console.firebase.google.com/", toggle)
C::openURL("https://mail.google.com/chat/u/0/#chat/welcome", toggle)
D::openURL("https://drive.google.com/drive/my-drive", toggle)
E::openURL("https://meet.google.com/", toggle)
F::openURL("https://docs.google.com/forms/u/0/", toggle)
G::openURL("https://mail.google.com/mail/u/0/#inbox", toggle)
H::openURL("https://calendar.google.com/calendar/u/0/r", toggle)
I::openURL("https://sites.google.com/new", toggle)
J::openURL("https://jamboard.google.com/", toggle)
K::openURL("https://keep.google.com/u/0/", toggle)
M::openURL("https://www.google.com/maps", toggle)
N::openURL("https://passwords.google.com/?standalone=false&hl=en&utm_source=google-account&utm_medium=web&pli=1", toggle)
O::openURL("https://console.cloud.google.com/", toggle)
P::openURL("https://photos.google.com/", toggle)
; Q::openURL("", toggle)
R::openURL("chrome://newtab", toggle)
S::openURL("https://docs.google.com/presentation/u/0/", toggle)
T::openURL("https://translate.google.co.uk/", toggle)
; U::openURL("", toggle)
V::openURL("https://www.instantstreetview.com/", toggle)
W::openURL("https://docs.google.com/document/u/0/", toggle)
X::openURL("https://docs.google.com/spreadsheets/u/0/", toggle)
Y::openURL("https://www.google.com/maps/d/u/0/", toggle)
Z::openURL("https://myaccount.google.com/", toggle)


+S::openURL("https://slides.new", toggle)
+W::openURL("https://docs.new", toggle)
+X::openURL("https://sheets.new", toggle)
+D::openURL("https://docs.google.com/drawings", toggle)


!W::openURL("https://news.google.com/",toggle)
!B::openURL("https://books.google.com/",toggle)
!D::openURL("https://datasetsearch.research.google.com/",toggle)
!N::openURL("https://www.google.com/finance/",toggle)
!F::openURL("https://www.google.com/flights",toggle)
!I::openURL("https://images.google.com/",toggle)
!S::openURL("https://scholar.google.com/",toggle)
!P::openURL("https://shopping.google.com/",toggle)
!Y::openURL("https://www.youtube.com/",toggle)
!A::openURL("https://patents.google.com/",toggle)

#If