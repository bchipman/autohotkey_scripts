#SingleInstance Force
#Persistent

; #IfWinActive, PyDev
; ^WheelUp::Send ^{NumpadAdd}
; ^=::Send ^{NumpadAdd}
; ^WheelDown::Send ^{NumpadSub}
; #IfWinActive

#IfWinActive ahk_class SWT_Window0
^WheelUp:: Send ^{=}
^WheelDown:: Send ^{-}
^/::  ; comment out current line and move down to next line
{
    Send ^/         ; ctrl /
    Send {Down}
    Send {Left}
    Send {Left}
    Return
}

F11::  ; clean and build
{
    Send ^!{c}      ; ctrl alt c
    Send {Enter}
    Send {F11}
    Return
}

#IfWinActive

