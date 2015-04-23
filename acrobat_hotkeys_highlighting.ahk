; v7
; Previous Name: 		_adobe_acrobat.ahk
#SingleInstance, 		Force
#Persistent

;========================================================================================

#IfWinActive, ahk_class AcrobatSDIWindow
Home::Return ; Disable Home key (goes to first page)
End::Return ; Disable End key (goes to last page)
; h::Gosub, press_h_in_acrobat
; b::Gosub, press_b_in_acrobat
; s::Gosub, press_s_in_acrobat
#IfWinActive

;========================================================================================
press_b_in_acrobat:
{
	Send {AppsKey}
	Send {m}
	Return
}


press_h_in_acrobat:
{
	Send {AppsKey}
	Send {h}
	Return
}

press_s_in_acrobat:
{
	Send {AppsKey}
	Send {t}
	Return
}

; press_g_in_acrobat:
; {
; 	Send ^{b}
; 	Send {AppsKey}
; 	Send {h}
; 	Return
; }
