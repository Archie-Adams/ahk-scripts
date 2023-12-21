#Include %A_ScriptDir%/functions/misc.ahk
#Include %A_ScriptDir%/functions/runs.ahk
#Include %A_ScriptDir%/functions/system.ahk
#Include %A_ScriptDir%/functions/toggles.ahk
#Include %A_ScriptDir%/functions/folders.ahk
#Include %A_ScriptDir%/functions/flipped_text.ahk

; ---------------------------------------------------------------------------- ;

;COMMAND|Toggle Powershell|togglers
;Opens a new Powershell window if none are open, otherwise switches to the open 
;window
#`::toggle_powershell()
;COMMAND|Instant Switch Chrome|togglers
;Opens a new chrome window if none are open alredy, focuses the last chrome 
;window already open or if already focused then switches tabs.
#c::switchToChrome()
;COMMAND|Instant Switch Explorer|togglers
;Opens a new explorer window if none are open alredy, focuses the last explorer 
;window already open or if already focused then switches explore window.
#x::switchToExplorer()
;COMMAND|Close all explorers|misc
;Closes all explorer windows opened by instant switch
#^x::closeAllExplorers()

; Windows + Shift --------------------------------------------------------------

;COMMAND|E:\|open directories
;Opens E:\
+#F5::open_folder_drive_E()
;COMMAND|G:\|open directories
;Opens G:\
+#F6::open_folder_drive_G()
;COMMAND|C:\|open directories
;Opens C:\
+#F7::open_folder_drive_C()
;COMMAND|F:\|open directories
;Opens F:\
+#F8::open_folder_drive_F()

;COMMAND|Powershell|run programs
;Opens Powershell
+#`::run_powershell()

;COMMAND|GOG|run programs
;Opens GOG
+#q::run_gog()
;COMMAND|Microsoft Word|run programs
;Opens Microsoft Word
+#w::run_microsoft_word()
;COMMAND|Sublime Text 3|run programs
;Opens Sublime Text 3
+#t::run_sublime_text_3()
;COMMAND|YouTube|run programs
;Opens www.youtube.com/subscriptions
+#y::run_youtube_subscriptions_chrome()
;COMMAND|Duolingo|run programs
;Opens duolingo.com
+#u::run_duolingo_chrome()
;COMMAND|LinkedIn|run programs
;Opens www.linkedin.com
+#i::run_linkedin_profile_chrome()
;COMMAND|OneNote|run programs
;Opens OneNote
+#o::run_onenote()
;COMMAND|Google Photos|run programs
;Opens www.photos.google.com
+#p::run_google_photos_chrome()

;COMMAND|MSI Afterburner|run programs
;Opens MSI Afterburner
+#a::run_msi_afterburner()
;COMMAND|Discord|run programs
;Opens Discord
+#d::run_discord()
;COMMAND|Microsoft Teams|run programs
;Opens Microsoft Teams
+#f::run_microsoft_teams()
;COMMAND|Gmail|run programs
;Opens www.mail.google.com
+#g::run_gmail_chrome()
;COMMAND|Google Calendar|run programs
;Opens www.calendar.google.com
+#h::run_google_calendar_chrome()
;COMMAND|Downloads|run programs
;Opens the Downloads folder
+#j::open_folder_downloads()
;COMMAND|OneDrive|run programs
;Opens the OneDrive folder
+#k::open_folder_OneDrive()
;COMMAND|OneDrive University of Leeds|run programs
;Opens the University of Leeds OneDrive folder
+#l::open_folder_OneDrive_UoL()
;COMMAND|Outlook|run programs
;Opens the www.outlook.com
+#;::run_outlook_chrome()

;COMMAND|Google Chrome|run programs
;Opens Google Chrome
+#z::run_chrome()
;COMMAND|Search selected text|default
;Searches the selected text using Google Chrome
+#c::search_selected_text()
;COMMAND|VSCode|run programs
;Opens VSCode
+#v::run_vscode()
;COMMAND|GitHub|run programs
;Opens www.github.com
+#b::run_github_chrome()
;COMMAND|Netflix|run programs
;Opens www.netflix.com
+#n::run_netflix_chrome()
;COMMAND|Google Maps|run programs
;Opens www.google.com/maps
+#m::run_google_maps_chrome()

; ----------------------------- Windows + Control ---------------------------- ;

; +#^F8::run, D:\

; +#^q::Run, "G:\Games\1) Steam\steam.exe"

; +#^w::Run, "https://docs.google.com/document/u/0/"

; +#^e::Run, "C:\Program Files\Microsoft Office\Root\Office16\EXCEL.EXE"

; +#^u::Run, chrome.exe "https://www.udemy.com/"

; +#^i::Run, chrome.exe "https://www.linkedin.com/learning/me?trk=nav_neptune_learning&u=57895809"

; +#^p::Run, "C:\Program Files\Microsoft Office\Root\Office16\POWERPNT.EXE"

; +#^d::Run, C:\Users\archi\Documents

; +#^g::Run, chrome.exe "https://drive.google.com/drive/my-drive"

; +#^z::Run, chrome.exe -incognito


; ------------------------------- Windows + Alt ------------------------------ ;

; #!w::Run, chrome.exe "https://whimsical.com/"

; #!t::Run, chrome.exe "https://studentservices.leeds.ac.uk/pls/banprod/timetable_uol"

; #!p::Run, "C:\Program Files\paint.net\PaintDotNet.exe"

; #!a::Run, chrome.exe "https://www.amazon.co.uk/"

; #!s::Run shell:startup

; #!d::Run, chrome.exe "https://app.diagrams.net/"

; #!g::Run, chrome.exe "https://www.gradescope.com/"

; #!k:: ; Runs Mircrosoft store camera app.Run shell:AppsFolder\Microsoft.WindowsCamera_8wekyb3d8bbwe!App

; #!c:: ; Runs Mircrosoft store clock app.Run shell:AppsFolder\Microsoft.WindowsAlarms_8wekyb3d8bbwe!App

; #!b::Run, "C:\Program Files (x86)\MusicBee\MusicBee.exe"

; #!n::Run, chrome.exe "https://www.notion.so/"

; #!m::Run, chrome.exe "https://minerva.leeds.ac.uk/"

; ------------------------------------------------------------------------------

; ---------------------------------------------------------------------------- ;
;                             flipped text hotkeys                             ;
; ---------------------------------------------------------------------------- ;

;COMMAND|Toggle Flipped Text Mode|flip-text
;When toggle is active the main keys of the keyboard will be sent as flipped 
;versions of themselves.
!+Space::toggleFlippedTextToggle()
;COMMAND|Flip Selected Text|flip-text
;Flips the selected text
#!+Space::flipSelectedText()

#If (toggle_flipped_text)

; Typing keys
Space::Send {Space}{Left}
Enter::Send {End}{Enter}
Tab::Send {Tab}{Left}
Left::Send {Right}
Right::Send {Left}
Delete::Send {Backspace}
Backspace::Send {Delete}

; Punctuation
; TODO: Rest of standard keyboaard punctuation
!::Send ¡{Left} ; - INVERTED EXCLAMATION MARK (U+00A1)
; @ ; - ; FIXME
#::Send #{Left} ; - Identical
; £ ; - ; FIXME
$::Send ${Left} ; - Identical
; % ; - ; FIXME
; ^ ; - ; FIXME
&::Send ⅋{Left} ; - TURNED AMPERSAND (U+214B)
; *

"::Send „{Left} ; - DOUBLE LOW9 QUOTATION MARK (U+201E)
'::Send ,{Left} ; - COMMA (U+002C)

(::Send ){Left} ; - RIGHT PARENTHESIS (U+0029)
)::Send ({Left} ; - Left PARENTHESIS
<::Send >{Left} ; - Greater THAN SIGN (U+003E)
>::Send <{Left} ; - Less than sign
{::Send {}}{Left} ; - RIGHT CURLY BRACKET (U+007D)
}::Send {{}{Left} ; - Left CURLY BRACKET
[::Send ]{Left} ; - RIGHT SQUARE BRACKET (U+005D)
]::Send [{Left} ; - Left SQUARE BRACKET

.::Send ˙{Left} ; - DOT ABOVE (U+02D9)
,::Send {`'}{Left} ; - apostrophe
`;::Send ؛{Left} ; - ARABIC SEMICOLON (U+061B)
?::Send ¿{Left} ; - INVERTED QUESTION MARK (U+00BF)
_::Send ‾{Left} ; - OVERLINE (U+203E)

; Numbers
0::Send 0{Left} ; - Identical
1::Send Ɩ{Left} ; - iota
2::Send ᄅ{Left} ; - hangul choseong rieul (U+1105)
3::Send Ɛ{Left} ; - LATIN CAPITAL LETTER OPEN E (U+0190)
4::Send ᔭ{Left} ; - CANADIAN SYLLABICS YA (U+152D)
5::SEND ϛ{Left} ; - ; Stigma (ligature)
6::Send 9{Left} ; - DIGIT NINE (U+0039)
7::Send Ɫ{Left} ; - LATIN CAPITAL LETTER L WITH MIDDLE TILDE (U+2C62)
8::Send 8{Left} ; - Identical
9::Send 6{Left} ; - Digit Six

; Capitalised Latin Letters
+A::Send ∀{Left} ; - FOR ALL (U+2200)
+B::Send 𐐒{Left} ; - DESERET CAPITAL LETTER BEE (U+10412)
+C::Send Ↄ{Left} ; - ROMAN NUMERAL REVERSED ONE HUNDRED (U+2183)
+D::Send ◖{Left} ; - LEFT HALF BLACK CIRCLE (U+25D6)
+E::Send Ǝ{Left} ; - LATIN CAPITAL LETTER REVERSED E (U+018E)
+F::Send Ⅎ{Left} ; - TURNED CAPITAL F (U+2132)
+G::Send ⅁{Left} ; - TURNED SANSSERIF CAPITAL G (U+2141)
+H::Send H{Left} ; - Identical
+I::Send I{Left} ; - Identical
+J::Send ſ{Left} ; - LATIN SMALL LETTER LONG S (U+017F)
+K::Send ⋊{Left} ; - RIGHT NORMAL FACTOR SEMIDIRECT PRODUCT (U+22CA)
+L::Send ⅂{Left} ; - TURNED SANSSERIF CAPITAL L (U+2142)
+M::Send W{Left} ; - LATIN CAPITAL LETTER W (U+0057)
+N::Send ᴎ{Left} ; - LATIN LETTER SMALL CAPITAL REVERSED N (U+1D0E)
+O::Send O{Left} ; - Identical
+P::Send Ԁ{Left} ; - CYRILLIC CAPITAL LETTER KOMI DE (U+0500)
+Q::Send Ό{Left} ; - GREEK CAPITAL LETTER OMICRON WITH TONOS (U+038C)
+R::Send ᴚ{Left} ; - LATIN LETTER SMALL CAPITAL TURNED R (U+1D1A)
+S::Send Ƨ{Left} ; - https://en.wikipedia.org/wiki/%C6%A7
+T::Send ⊥{Left} ; - UP TACK (U+22A5)
+U::Send ∩{Left} ; - INTERSECTION (U+2229)
+V::Send ᴧ{Left} ; - GREEK LETTER SMALL CAPITAL LAMDA (U+1D27)
+W::Send M{Left} ; - Latin capital letter M
+X::Send X{Left} ; - Identical
+Y::Send ⅄{Left} ; - TURNED SANSSERIF CAPITAL Y (U+2144)
+Z::Send Z{Left} ; - ; FIXME

; Lowercase Latin Letters
a::Send ɐ{Left} ; - LATIN SMALL LETTER TURNED A (U+0250)
b::Send q{Left} ; - LATIN SMALL LETTER Q (U+0071)
c::Send ɔ{Left} ; - LATIN SMALL LETTER OPEN O (U+0254)
d::Send p{Left} ; - LATIN SMALL LETTER P (U+0070)
e::Send ǝ{Left} ; - LATIN SMALL LETTER TURNED E (U+01DD)
f::Send ɟ{Left} ; - LATIN SMALL LETTER DOTLESS J WITH STROKE (U+025F)
g::Send ƃ{Left} ; - LATIN SMALL LETTER B WITH TOPBAR (U+0183)
h::Send ɥ{Left} ; - LATIN SMALL LETTER TURNED H (U+0265)
i::Send ᴉ{Left} ; - Latin Small Letter Turned I (U+1D09)
j::Send ɾ{Left} ; - LATIN SMALL LETTER R WITH FISHHOOK (U+027E)
k::Send ʞ{Left} ; - LATIN SMALL LETTER TURNED K (U+029E)
l::Send l{Left} ; - Identical
m::Send ɯ{Left} ; - LATIN SMALL LETTER TURNED M (U+026F)
n::Send u{Left} ; - LATIN SMALL LETTER U (U+0075)
o::Send o{Left} ; - Identical
p::Send p{Left} ; - ; FIXME
q::Send q{Left} ; - ; FIXME
r::Send ɹ{Left} ; - LATIN SMALL LETTER TURNED R (U+0279)
s::Send ƨ{Left} ; - minuscule https://en.wikipedia.org/wiki/%C6%A7
t::Send ʇ{Left} ; - LATIN SMALL LETTER TURNED T (U+0287)
u::Send n{Left} ; - Latin lowercase n
v::Send ʌ{Left} ; - LATIN SMALL LETTER TURNED V (U+028C)
w::Send ʍ{Left} ; - LATIN SMALL LETTER TURNED W (U+028D)
x::Send x{Left} ; - Identical
y::Send ʎ{Left} ; - LATIN SMALL LETTER TURNED Y (U+028E)
z::Send z{Left} ; - ; FIXME

#If

; ---------------------------------------------------------------------------- ;

; For my keyboard ; TODO: Move into a misc scripts folder. ; Further TODO: Put it in the firmware
Shift & Backspace::Send, {Delete}

; SetTitleMatchMode, 2
#ifwinactive Visual Studio Code ahk_class Chrome_WidgetWin_1
::TOOD::TODO
::TD::TODO
#if

; Press ` to move up a folder in Explorer
#IfWinActive, ahk_class CabinetWClass
`::Send !{Up}
#IfWinActive
