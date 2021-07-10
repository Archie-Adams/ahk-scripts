; Windows key -----------------------------------------------------------------
#`:: ; Toggle powershell
{
    SetTitleMatchMode 2
    IfWinNotExist, Windows PowerShell
    {
        run powershell.exe -command "wsl; cd ~"
    }
    else
    {
        If WinExist, Windows PowerShell
        {
            WinActivate, Windows PowerShell
            Return
        }
        winclose, Windows PowerShell
    }
    Return
}

; TODO: Windows key + RAlt + / for global help file.

; Windows + Shift -------------------------------------------------------------
; +#F1::
; Return
; +#F2::
; Return
; +#F3::
; Return
; +#F4::
; Return
+#F5::
run, E:\
Return
+#F6::
run, G:\
Return
+#F7::
run, C:\
Return
+#F8::
run, F:\
Return
; +#F9::
; Return
; +#F10::
; Return
; +#F11::
; Return
; +#F12::
; Return



; +#`::
; Return
; +#1::
; Return
; +#2::
; Return
; +#3::
; Return
; +#4::
; Return
; +#5::
; Return
; +#6::
; Return
; +#7::
; Return
; +#8::
; Return
; +#9::
; Return
; +#0::
; Return
; +#-::
; Return
; +#=::
; Return



+#q::
Run, "C:\Program Files (x86)\GOG Galaxy\GalaxyClient.exe"
Return
+#w::
Run, "C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE"
Return
; +#e::
; Return
; +#r::
; Return
+#t::
Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Sublime Text 3"
Return
+#y::
Run, chrome.exe "https://www.youtube.com/feed/subscriptions"
Return
+#u::
Run, chrome.exe "https://www.duolingo.com/learn"
Return
+#i::
Run, chrome.exe "https://www.linkedin.com/in/archie-adams/"
Return
+#o::
Run, "C:\Program Files\Microsoft Office\Root\Office16\ONENOTE.exe"
Return
+#p::
Run, chrome.exe "https://photos.google.com/"
Return
; +#[::
; Return
; +#]::
; Return
; +#\::
; Return



+#a::
Run, "C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe"
Return
; +#s::
; Return
+#d::
Run, "C:\Users\archi\AppData\Local\Discord\Update.exe" --processStart Discord.exe
Return
+#f::
Run, "C:\Users\archi\AppData\Local\Microsoft\Teams\Update.exe" --processStart Teams.exe
Return
+#g::
Run, chrome.exe "https://mail.google.com/mail/u/0/#inbox"
Return
+#h::
Run, chrome.exe "https://calendar.google.com/calendar/r"
Return
+#j::
Run, C:\Users\archi\Downloads
Return
+#k::
run, C:\Users\archi\OneDrive ; Should use %A_UserName% for cross device compatability.
Return
+#l::
Run, "C:\Users\archi\OneDrive - University of Leeds\u"
Return
+#;::
Run, chrome.exe "https://outlook.office.com/mail/inbox"
Return
; +#'::
; Return


+#z::
Run, chrome.exe 
Return
; +#x::
; Return
+#c:: ; Search google with selected text.
{
    Send, ^c
    Sleep 50
    Run, http://www.google.com/search?q=%clipboard%
    Return
}
+#v::
Run, "C:\Users\archi\AppData\Local\Programs\Microsoft VS Code\Code.exe"
Return
+#b::
Run, chrome.exe "https://github.com/"
Return
+#n::
Run, chrome.exe "https://www.netflix.com/browse"
Return
+#m::
Run, chrome.exe "https://www.google.com/maps"
Return
; +#,::
; Return
; +#.::
; Return
; +#/::
; Return
; End Windows + Shift ---------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------



; Ctrl + Windows + Shift ------------------------------------------------------
; +#^F1::
; Return
; +#^F2::
; Return
; +#^F3::
; Return
; +#^F4::
; Return
; +#^F5::
; Return
; +#^F6::
; Return
; +#^F7::
; Return
+#^F8::
run, D:\
Return
; +#^F9::
; Return
; +#^F10::
; Return
; +#^F11::
; Return
; +#^F12::
; Return



; +#^`::
; Return
; +#^1::
; Return
; +#^2::
; Return
; +#^3::
; Return
; +#^4::
; Return
; +#^5::
; Return
; +#^6::
; Return
; +#^7::
; Return
; +#^8::
; Return
; +#^9::
; Return
; +#^0::
; Return
; +#^-::
; Return
; +#^=::
; Return



+#^q::
Run, "G:\Games\1) Steam\steam.exe"
Return
+#^w::
Run, "https://docs.google.com/document/u/0/"
Return
+#^e::
Run, "C:\Program Files\Microsoft Office\Root\Office16\EXCEL.EXE"
Return
; +#^r::
; Return
; +#^t::
; Return
; +#^y::
; Return
+#^u::
Run, chrome.exe "https://www.udemy.com/"
Return
+#^i::
Run, chrome.exe "https://www.linkedin.com/learning/me?trk=nav_neptune_learning&u=57895809"
Return
; +#^o::
; Return
+#^p::
Run, "C:\Program Files\Microsoft Office\Root\Office16\POWERPNT.EXE"
Return
; +#^[::
; Return
; +#^]::
; Return
; +#^\::
; Return



; +#^a::
; Return
; +#^s::
; Return
+#^d::
Run, C:\Users\archi\Documents
Return
; +#^f::
; Return
+#^g::
Run, chrome.exe "https://drive.google.com/drive/my-drive"
Return
; +#^h::
; Return
; +#^j::
; Return
; +#^k::
; Return
; +#^l::
; Return
; +#^;::
; Return
; +#^'::
; Return


+#^z::
Run, chrome.exe -incognito
Return
; +#^x::
; Return
; +#^c::
; Return
; +#^v::
; Return
; +#^b::
; Return
; +#^n::
; Return
; +#^m::
; Return
; +#^,::
; Return
; +#^.::
; Return
; +#^/::
; Return
; End Ctrl + Windows + Shift --------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------

; Alt + Windows + Shift ------------------------------------------------------
; +#!F1::
; Return
; +#!F2::
; Return
; +#!F3::
; Return
; +#!F4::
; Return
; +#!F5::
; Return
; +#!F6::
; Return
; +#!F7::
; Return
; +#!F8::
; Return
; +#!F9::
; Return
; +#!F10::
; Return
; +#!F11::
; Return
; +#!F12::
; Return



; +#!`::
; Return
; +#!1::
; Return
; +#!2::
; Return
; +#!3::
; Return
; +#!4::
; Return
; +#!5::
; Return
; +#!6::
; Return
; +#!7::
; Return
; +#!8::
; Return
; +#!9::
; Return
; +#!0::
; Return
; +#!-::
; Return
; +#!=::
; Return



; +#!q::
; Return
; +#!w::
; Return
; +#!e::
; Return
; +#!r::
; Return
; +#!t::
; Return
; +#!y::
; Return
; +#!u::
; Return
; +#!i::
; Return
; +#!o::
; Return
; +#!p::
; Return
; +#![::
; Return
; +#!]::
; Return
; +#!\::
; Return



; +#!a::
; Return
; +#!s::
; Return
; +#!d::
; Return
; +#!f::
; Return
; +#!g::
; Return
; +#!h::
; Return
; +#!j::
; Return
; +#!k::
; Return
; +#!l::
; Return
; +#!;::
; Return
; +#!'::
; Return


; +#!z::
; Return
; +#!x::
; Return
; +#!c::
; Return
; +#!v::
; Return
; +#!b::
; Return
; +#!n::
; Return
; +#!m::
; Return
; +#!,::
; Return
; +#!.::
; Return
; +#!/::
; Return
; End Alt + Windows + Shift --------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------



; Windows + Alt ---------------------------------------------------------------
; #!F1::
; Return
; #!F2::
; Return
; #!F3::
; Return
; #!F4::
; Return
; #!F5::
; Return
; #!F6::
; Return
; #!F7::
; Return
; #!F8::
; Return
; #!F9::
; Return
; #!F10::
; Return
; #!F11::
; Return
; #!F12::
; Return



; #!`::
; Return
; #!1::
; Return
; #!2::
; Return
; #!3::
; Return
; #!4::
; Return
; #!5::
; Return
; #!6::
; Return
; #!7::
; Return
; #!8::
; Return
; #!9::
; Return
; #!0::
; Return
; #!-::
; Return
; #!=::
; Return



; #!q::
; Return
#!w::
Run, chrome.exe "https://whimsical.com/"
Return
; #!e::
; Return
; #!r::
; Return
#!t::
Run, chrome.exe "https://studentservices.leeds.ac.uk/pls/banprod/timetable_uol"
Return
; #!y::
; Return
; #!u::
; Return
; #!i::
; Return
; #!o::
; Return
#!p::
Run, "C:\Program Files\paint.net\PaintDotNet.exe"
Return
; #![::
; Return
; #!]::
; Return
; #!\::
; Return



#!a::
Run, chrome.exe "https://www.amazon.co.uk/"
Return
#!s::
Run shell:startup
Return
#!d::
Run, chrome.exe "https://app.diagrams.net/"
Return
; #!f::
; Return
#!g::
Run, chrome.exe "https://www.gradescope.com/"
Return
; #!h::
; Return
; #!j::
; Return
; #!k::
; Return
; #!l::
; Return
; #!;::
; Return
; #!'::
; Return



; #!z::
; Return
; #!x::
; Return
#!c:: ; Runs Mircrosoft store clock app.
Run shell:AppsFolder\Microsoft.WindowsAlarms_8wekyb3d8bbwe!App
Return
; #!v::
; Return
#!b::
Run, "C:\Program Files (x86)\MusicBee\MusicBee.exe"
Return
; #!n::
; Return
#!m::
Run, chrome.exe "https://minerva.leeds.ac.uk/"
Return
; #!,::
; Return
; #!.::
; Return
; #!/::
; Return
; End Windows + Alt  ----------------------------------------------------------
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------