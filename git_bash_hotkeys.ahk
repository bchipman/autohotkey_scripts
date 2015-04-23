#SingleInstance Force
#Persistent

; Note that this is the same ahk_class as the default cmd.exe
#IfWinActive, ahk_class ConsoleWindowClass
+^BackSpace::^u
#IfWinActive
