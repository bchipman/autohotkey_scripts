#SingleInstance Force
#Persistent

; Google Chrome
#IfWinActive, ahk_class Chrome_WidgetWin_1
^d::Return
^+b::^d
^!b::^+o
; $!f::Gosub, google_chrome_alt_f_handler  ;$ means keystroke is not actually sent
#IfWinActive

; Mozilla Firefox
#IfWinActive, ahk_class MozillaWindowClass
+WheelUp::Gosub, handle_mouse_wheel_up_in_firefox
+WheelDown::Gosub, handle_mouse_wheel_down_in_firefox
#IfWinActive

handle_mouse_wheel_up_in_firefox:
{
    Send {Left}
    Return
}


handle_mouse_wheel_down_in_firefox:
{
    Send {Right}
    Return
}

google_chrome_alt_f_handler:
{
    BlockInput, On
    Sleep, 3000
    Send, {AltUp}
    Sleep, 3000
    Send, {AltDown}
    Sleep, 3000
    Send, {AltUp}
    BlockInput, Off

    ; ; Sleep, 2000
    ; BlockInput On
    ; ; ToolTip, Input is now BLOCKED!

    ; Sleep, 1000
    ; ; Send, {Alt Up}
    ; SendInput, {Alt Up}
    ; ToolTip, Sent Alt Up


    ; Sleep, 1000
    ; SendInput, {Alt Down}
    ; ToolTip, Sent Alt Down

    ; Sleep, 1000
    ; SendInput, {f}
    ; ToolTip, Sent 'f'

    ; Sleep, 1000
    ; SendInput, {Alt Up}
    ; ToolTip, Sent Alt Up (again)

    ; Sleep, 1000
    ; BlockInput Off
    ; ToolTip, Input is no longer blocked!  Now waiting for 'x'...

    ; KeyWait, x, D T3
    ; if (%ErrorLevel% == 0)
    ; {
    ;     Sleep 250
    ;     ToolTip, You pressed 'x' within 3 seconds!

    ;     BlockInput On
    ;     SendInput, {Alt Up}
    ;     SendInput, {x}
    ;     BlockInput Off
    ; }


    ; ToolTip, Hey. I just pressed alt down and then f for you
    ; Sleep, 500
    ; Send, {Alt Up}


    ; KeyWait, x, D T3
    ; if (%ErrorLevel% == 0) {
    ;     Sleep 250
    ;     ToolTip, You pressed 'x' within 3 seconds!
    ;     ; if alt is down..
    ;     Send, {Alt Up}
    ;     Send, {x}

    ; }
    ; else
    ;     ToolTip, You FAILED to press 'x' within 3 seconds!

    ; Send, x
    Return

}
