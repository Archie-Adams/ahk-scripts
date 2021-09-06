#SingleInstance, force

Gui, Margin, 16, 16
Gui, Color, 1d1f21, 282a2e
Gui, +AlwaysOnTop -SysMenu +ToolWindow -caption +Border
Gui, Font, s11 cwhite, Segoe UI
Gui, add, text, x10, Gmail: G
Gui, add, text, x10, Google Calendar: H
Gui, add, text, x10, Google Docs: W
Gui, add, text, x10, Google Sheets: S
Gui, add, text, x10, Google Slides: P
Gui, add, text, x10, Google Drive: D
Gui, add, text, x10, Google Meet: M
Gui, add, text, x10, Google Chat: C
Gui, add, text, x10, Google Apps Script: A
Gui, add, text, x10, Google Forms: F
Gui, add, text, x10, Google Sites: I
Gui, Font, strike
Gui, add, text, x10, Google Currents: U
Gui, Font, norm
Gui, add, text, x10, Google Keep: K
Gui, Font, strike
Gui, add, text, x10, Google Cloud Search: Q
Gui, Font, norm
Gui, add, text, x10, Google Jamboard: J
Gui, Add, Text, x10 w150 0x10  ;Horizontal Line > Etched Gray
Gui, add, text, x10, New Docs: SHIFT+W
Gui, add, text, x10, New Sheets: SHIFT+S
Gui, add, text, x10, New Slides: SHIFT+P

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
  Run, chrome.exe %url%
  toggle := !toggle
  Gui, hide
}

G::openURL("https://mail.google.com/mail/u/0/#inbox", toggle)
H::openURL("https://calendar.google.com/calendar/u/0/r", toggle)
W::openURL("https://docs.google.com/document/u/0/", toggle)
S::openURL("https://docs.google.com/spreadsheets/u/0/", toggle)
P::openURL("https://docs.google.com/presentation/u/0/", toggle)
D::openURL("https://drive.google.com/drive/my-drive", toggle)
M::openURL("https://meet.google.com/", toggle)
C::openURL("https://mail.google.com/chat/u/0/#chat/welcome", toggle)
A::openURL("https://script.google.com/home/start", toggle)
F::openURL("https://docs.google.com/forms/u/0/", toggle)
I::openURL("https://sites.google.com/new", toggle)
; U::openURL("", toggle)
K::openURL("https://keep.google.com/u/0/", toggle)
; Q::openURL("", toggle)
J::openURL("https://jamboard.google.com/", toggle)

+W::openURL("https://docs.new", toggle)
+P::openURL("https://slides.new", toggle)
+S::openURL("https://sheets.new", toggle)

#If