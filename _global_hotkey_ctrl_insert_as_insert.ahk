#SingleInstance, Force
#Persistent

*Ins::Return ; Disables Insert +/- modifier keys (* = wildcard)
>^Ins::Send {Ins} ; Maps RCtrl+Insert to Insert 

; >^Insert::Insert
; The above line won't work; instead it will send Ctrl+Ins when RCtrl+Ins is pressed
