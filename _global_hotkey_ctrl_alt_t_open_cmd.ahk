#SingleInstance, Force
#Persistent

#IfWinActive, ahk_class Console_2_Main
^x::WinClose, ahk_class Console_2_Main
^!x::WinClose, ahk_class Console_2_Main
#IfWinActive


^!t::
{
    IfWinExist, ahk_class Console_2_Main
        WinActivate, ahk_class Console_2_Main
    Else
        Run, "C:\Dropbox\.ProgramFiles\Console2\Console.exe"
    Return
}


^!+t::Run, "C:\Dropbox\.ProgramFiles\ConEmu\ConEmu64.exe"
