#SingleInstance, Force
#Persistent

JoyStickNumber = 1
GetKeyState, number_joy_buttons, %JoyStickNumber%JoyButtons
ToolTip, AHK - Found %number_joy_buttons% gamepad buttons, A_ScreenWidth/2, A_ScreenHeight/2
SetTimer, RemoveToolTip, 5000

;--------------------------------------------------------------------------------------------------

#IfWinExist, ahk_class MediaPlayerClassicW

Joy1::Gosub, mpc_hc_check_joy1
Joy2::Gosub, mpc_hc_check_joy2
Joy3::Gosub, mpc_hc_check_joy3
Joy4::Gosub, mpc_hc_check_joy4

Joy5::Gosub, mpc_hc_check_joy5
Joy6::Gosub, mpc_hc_check_joy6
Joy7::Gosub, mpc_hc_check_joy7
Joy8::Gosub, mpc_hc_check_joy8

Joy9::Gosub, mpc_hc_check_joy9
Joy10::Gosub, mpc_hc_check_joy10
Joy11::Gosub, mpc_hc_check_joy11
Joy12::Gosub, mpc_hc_check_joy12

#IfWinExist

;--------------------------------------------------------------------------------------------------
mpc_hc_check_joy1:
{
	If number_joy_buttons = 10
		Gosub, mpc_hc_pressed_a
	Else
		Gosub, mpc_hc_pressed_x
	Return
}

mpc_hc_check_joy2:
{
	If number_joy_buttons = 10
		Gosub, mpc_hc_pressed_b
	Else
		Gosub, mpc_hc_pressed_a
	Return
}

mpc_hc_check_joy3:
{
	If number_joy_buttons = 10
		Gosub, mpc_hc_pressed_x
	Else
		Gosub, mpc_hc_pressed_b
	Return
}

mpc_hc_check_joy4:
{
	Gosub, mpc_hc_pressed_y
	Return
}

mpc_hc_check_joy5:
{
	Gosub, mpc_hc_pressed_L1
	Return
}

mpc_hc_check_joy6:
{
	Gosub, mpc_hc_pressed_R1
	Return
}

mpc_hc_check_joy7:
{
	If number_joy_buttons = 10
		Gosub, mpc_hc_pressed_back
	Else
		Gosub, mpc_hc_pressed_L2
	Return
}

mpc_hc_check_joy8:
{
	If number_joy_buttons = 10
		Gosub, mpc_hc_pressed_start
	Else
		Gosub, mpc_hc_pressed_R2
	Return
}

mpc_hc_check_joy9:
{
	If number_joy_buttons = 10
		Gosub, mpc_hc_pressed_left_stick
	Else
		Gosub, mpc_hc_pressed_back
	Return
}

mpc_hc_check_joy10:
{
	If number_joy_buttons = 10
		Gosub, mpc_hc_pressed_right_stick
	Else
		Gosub, mpc_hc_pressed_start
	Return
}

mpc_hc_check_joy11:
{
	Gosub, mpc_hc_pressed_left_stick
	Return
}

mpc_hc_check_joy12:
{
	Gosub, mpc_hc_pressed_right_stick
	Return
}


;-----------------------------------------------------------------------------
mpc_hc_pressed_a: ; Play/Pause
{
	WinActivate, ahk_class MediaPlayerClassicW
	Send, {Space}
	Return
}

mpc_hc_pressed_y: ; FullScreen
{
	WinActivate, ahk_class MediaPlayerClassicW
	Send, !{Enter} ; Alt + Enter
	Return
}

mpc_hc_pressed_x:
{
	Return
}

mpc_hc_pressed_b:
{
	Return
}

mpc_hc_pressed_start: ; Open Download Subtitles Window
{
	WinActivate, ahk_class MediaPlayerClassicW
	Send, d
	Return
}

mpc_hc_pressed_back: ; Close Player
{
	WinActivate, ahk_class MediaPlayerClassicW
	Send, !{F4}
	Return
}
;--------------------------------------------------------------------------------------------------
mpc_hc_pressed_L1: ; Small Jump Backward
{
	WinActivate, ahk_class MediaPlayerClassicW
	Send, +{Left} ; Shift + Left
	Return
}

mpc_hc_pressed_L2: ; Large Jump Backward
{
	WinActivate, ahk_class MediaPlayerClassicW
	Send, !{Left} ; Alt + Left
	Return
}
;--------------------------------------------------------------------------------------------------
mpc_hc_pressed_R1: ; Small Jump Forward
{
	WinActivate, ahk_class MediaPlayerClassicW
	Send, +{Right} ; Shift + Right
	Return
}

mpc_hc_pressed_R2: ; Large Jump Forward
{
	WinActivate, ahk_class MediaPlayerClassicW
	Send, !{Right} ; Alt + Right
	Return
}
;-----------------------------------------------------------------------------
mpc_hc_pressed_left_stick: ; Previous
{
	WinActivate, ahk_class MediaPlayerClassicW
	Send, {Pgup} ; Page Up
	Return
}

mpc_hc_pressed_right_stick: ; Next
{
	WinActivate, ahk_class MediaPlayerClassicW
	Send, {PgDn} ; Page Down
	Return
}


;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
; Microsoft PC-joystick driver (#1)

; SWITCHED TO X
; Number of Buttons = 10

; joy1 = A
; joy2 = B
; joy3 = X
; joy4 = Y

; joy5 = L1
; joy6 = R1

; joy7 = BACK
; joy8 = START

; joy9 = LEFT STICK PUSHED
; joy10 = RIGHT STICK PUSHED

; ------------------------------------------------------------------------------

; Microsoft PC-joystick driver (#1)

; SWITCHED TO D
; Number of Buttons = 12

; joy1 = X
; joy2 = A
; joy3 = B
; joy4 = Y

; joy5 = L1
; joy6 = R1

; joy7 = L2
; joy8 = R2

; joy9 = BACK
; joy10 = START

; joy11 = LEFT STICK PUSHED
; joy12 = RIGHT STICK PUSHED
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------

; WatchPOV:
; {
; 	; #IfWinExist, Subtitles available online
; 	; #IfWinExist

; 	GetKeyState, POV, JoyPOV  				; Get position of the POV control.
; 	KeyToHoldDownPrev = %KeyToHoldDown%  	; Prev now holds the key that was down before (if any).

; 	if POV < 0   ; No angle to report
; 	    KeyToHoldDown =
; 	else if POV > 31500                 ; 315 to 360 degrees: Forward
; 	    KeyToHoldDown = Up
; 	else if POV between 0 and 4500      ; 0 to 45 degrees: Forward
; 	    KeyToHoldDown = Up
; 	else if POV between 4501 and 13500  ; 45 to 135 degrees: Right
; 	    KeyToHoldDown = Right
; 	else if POV between 13501 and 22500 ; 135 to 225 degrees: Down
; 	    KeyToHoldDown = Down
; 	else                                ; 225 to 315 degrees: Left
; 	    KeyToHoldDown = Left

; 	if KeyToHoldDown = %KeyToHoldDownPrev%  ; The correct key is already down (or no key is needed).
; 	    return  ; Do nothing.

; 	; Otherwise, release the previous key and press down the new key:
; 	SetKeyDelay -1  ; Avoid delays between keystrokes.
; 	if KeyToHoldDownPrev   ; There is a previous key to release.
; 	    Send, {%KeyToHoldDownPrev% up}  ; Release it.
; 	if KeyToHoldDown   ; There is a key to press down.
; 	    Send, {%KeyToHoldDown% down}  ; Press it down.
; 	return

; }
