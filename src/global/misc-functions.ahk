;(https://www.maketecheasier.com/favorite-autohotkey-scripts/) ----------------

; Press ~ to move up a folder in Explorer
#IfWinActive, ahk_class CabinetWClass
`::Send !{Up}
#IfWinActive
return
; -----------------------------------------------------------------------------