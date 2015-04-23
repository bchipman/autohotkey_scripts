#SingleInstance Force
#Persistent

;--------------------------------------------------------------------------------------------------

; WORD
#IfWinActive, ahk_class OpusApp
^+z::Send ^{y}
#IfWinActive

; EXCEL
#IfWinActive, ahk_class XLMAIN
^+z::Send ^{y}
+WheelUp::Gosub, handle_mouse_wheel_up_in_excel
+WheelDown::GoSub, handle_mouse_wheel_down_in_excel
; End::Return
; Home::Return
#IfWinActive

; POWERPOINT
#IfWinActive, ahk_class PPTFrameClass
^+z::Send ^{y}
#IfWinActive

; VISIO
#IfWinActive, ahk_class VISIOA
^+z::Send ^{y}
#IfWinActive

; MOVIE MAKER
#IfWinActive, ahk_exe MovieMaker.exe
^+z::Send ^{y}
#IfWinActive

;--------------------------------------------------------------------------------------------------

handle_mouse_wheel_up_in_excel:
{
    GetKeyState, state, ScrollLock, T
    if state = D  ; ScrollLock is ON
        Send {Left}
    else if state = U  ; ScrollLock is OFF
    {
        Send {ScrollLock}
        Send {Left}
        Send {ScrollLock}
    }
    Return
}
handle_mouse_wheel_down_in_excel:
{
    GetKeyState, state, ScrollLock, T
    if state = D  ; ScrollLock is ON
        Send {Right}
    else if state = U  ; ScrollLock is OFF
    {
        Send {ScrollLock}
        Send {Right}
        Send {ScrollLock}
    }
    Return
}


