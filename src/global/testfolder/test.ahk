; StartTime := A_TickCount

; g::
; StartTime := A_MSec
; return

; g UP::
; If (%A_MSec% - %StartTime% < 1000) {
;   Send, G
; } else {
;   MsgBox, LongPress
; }
; return




;?????????????????????????????????????\ .-------------------------------------+
return                                 ;                                      |
Timer:                                 ; -  - triple Tap + Hold - BLOCK 1 -  -|
   {                                   ; This is the block that starts        |
    If !%A_ThisHotkey%key              ; the count forall Hotkeys.            |
    SetTimer, %A_ThisHotkey%key, -400  ; Make sure it is placed above         |
    %A_ThisHotkey%key++                ; Block 2 & that the prefix is changed |
    Return                             ; to match the key's Name, as only 1   |
            }                          ; may Exist. instance of this lable    |
;_____________________________________/ `-------------------------------------+



Q:: goto timer
;???????????????????????????????????????????\
qkey:                                        ;           +------------------+
If GetKeyState("q","P") and %A_ThisLabel%=1  ;>----------¦   Hold  Action   ¦
     msgbox you held down the key Q          ;           +------------------+
;  -  -  -  -  -  -  -  -  -  -  -  -  -  -  +
   Else If %A_ThisLabel% = 3                 ;           +------------------+
    msgbox you pressed the key Q 3 times     ;>----------¦ 3X Press  Action ¦
;  -  -  -  -  -  -  -  -  -  -  -  -  -  -  +           +------------------+
   Else If %A_ThisLabel% = 2                 ;           +------------------+
    msgbox you pressed the key Q 2 times     ;>----------¦ 2X Press  Action ¦
;  -  -  -  -  -  -  -  -  -  -  -  -  -  -  +           +------------------+
   Else If %A_ThisLabel% = 1                 ;           +------------------+
     msgbox you pressed the key Q 1 time     ;>----------¦ 1X Press  Action ¦
;  -  -  -  -  -  -  -  -  -  -  -  -  -  -  +           +------------------+
%A_ThisLabel%=0                              ;
 return                                      ;
;___________________________________________/