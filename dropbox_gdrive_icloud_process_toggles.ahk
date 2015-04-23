#SingleInstance, Force
#Persistent

^#a::  ;flawed logic.  can never start it again since this script will be closed.
{
    Process, Exist, AutoHotkeyU64.exe
    if (%ErrorLevel% == 0)
        Run, "C:\Dropbox\.ProgramFiles\AutoHotkey\AutoHotkeyU64.exe" "C:\Dropbox\Texts\.ahk\_active_scripts_\__master_script__.ahk"
    else
    {
        Loop
        {
            Process, Close, %ErrorLevel%
            Sleep, 250
            Process, Exist, AutoHotkeyU64.exe
            if (%ErrorLevel% == 0)
                Return
        }
    }
}

^#d::
{
    Process, Exist, Dropbox.exe  ; puts PID# in ErrorLevel (or 0 if none)
    if (%ErrorLevel% == 0)
        Run, C:\Users\Brian\AppData\Roaming\Dropbox\bin\dropbox.exe
    else
        Process, Close, %ErrorLevel%
    Sleep, 250
    Return
}

^#t::
{
    Process, Exist, TeamViewer.exe
    if (%ErrorLevel% == 0)
    {
        Run, "C:\Program Files (x86)\TeamViewer\TeamViewer.exe"
        Sleep, 2500
        IfWinActive, ahk_class #32770
            WinClose, ahk_class #32770
        Return
    }
    else
    {
        Process, Close, %ErrorLevel%
        Sleep, 250
        Process, Exist, TeamViewer_Service.exe
        if (%ErrorLevel% != 0)
            Process, Close, %ErrorLevel%
        Return
    }
}

^#g::
{
    Process, Exist, googledrivesync.exe
    if (%ErrorLevel% == 0)
    {
        Run, "C:\Program Files (x86)\Google\Drive\googledrivesync.exe"
        Sleep, 250
        Return
    }
    else
    {
        Loop
        {
            Process, Close, %ErrorLevel%
            Sleep, 250
            Process, Exist, googledrivesync.exe
            if (%ErrorLevel% == 0)
                Return
        }
    }
}


^#i::
{
    Process, Exist, iCloudServices.exe
    if (%ErrorLevel% == 0)
        Run, "C:\Program Files (x86)\Common Files\Apple\Internet Services\iCloudServices.exe"
    else
        Process, Close, %ErrorLevel%
    Sleep, 250
    Return
}


^#c::
{
    Process, Exist, CCC.exe
    if (%ErrorLevel% == 0)
        Run, "C:\Program Files (x86)\ATI Technologies\ATI.ACE\Core-Static\CCC.exe"
    else
        Process, Close, %ErrorLevel%
    Sleep, 250
    Return
}

