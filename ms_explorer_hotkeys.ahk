#SingleInstance Force
#Persistent

;--------------------------------------------------------------------------------------------------

#IfWinActive, ahk_class Progman
^+f::Gosub, win_explorer_ctrl_shift_f_new_file_on_desktop      ; Ctrl+Shift+F
#IfWinActive

#IfWinActive, ahk_class #32770
^l::Gosub, open_file_popup_ctrl_l_focus_address_bar    ; Ctrl+L
::pf::%pf%
::pf64::%pf64%
::pf86::%pf86%
::pf32::%pf32%
::w::%w%
::sys32::%sys32%
::system32::%system32%
::u::%u%
::user::%user%
::dl::%dl%
::dls::%dls%
::downloads::%downloads%
::pics::%pics%
::pictures::%pictures%
::vids::%vids%
::videos::%videos%
::docs::%docs%
::documents::%documents%
::desktop::%desktop%
::dt::%dt%
::dropbox::%dropbox%
::db::%db%
::googledrive::%googledrive%
::gdrive::%gdrive%
::gd::%gd%
::pfdb::%pfdb%
::dbpf::%dbpf%
::dbsettings::%dbsettings%
::dbpfsettings::%dbpfsettings%
::pfdbsettings::%pfdbsettings%
::texts::%texts%
::books::%books%
::screenshots::%screenshots%
::school::%school%
::st::%st%
::st3::%st3%
::py2::%py2%
::py27::%py27%
::py::%py%
::py3::%py3%
::py34::%py34%
::cs113game::%cs113game%
::javac::%javac%
::allappdata::%allappdata%
::appdataall::%appdataall%
::roamingappdata::%roamingappdata%
::appdataroaming::%appdataroaming%
::rappdata::%rappdata%
::appdatar::%appdatar%
::localappdata::%localappdata%
::appdatalocal::%appdatalocal%
::lappdata::%lappdata%
::appdatal::%appdatal%
::gadgets::%gadgets%
::jetbrains::%jetbrains%
::startup::%startup%
::startup1::%startup1%
::startupall::%startupall%
::allstartup::%allstartup%
::startup2::%startup2%
::startupuser::%startupuser%
::userstartup::%userstartup%
#IfWinActive

#IfWinActive, ahk_class CabinetWClass
^l::Gosub, win_explorer_ctrl_l_focus_address_bar    ; Ctrl+L
^+f::Gosub, win_explorer_ctrl_shift_f_new_file      ; Ctrl+Shift+F
$^+n::Gosub, win_explorer_ctrl_shift_n_new_folder   ; Ctrl+Shift+N  without $, hotkey would activate itself in an infinite loop
::pf::%pf%
::pf64::%pf64%
::pf86::%pf86%
::pf32::%pf32%
::w::%w%
::sys32::%sys32%
::system32::%system32%
::u::%u%
::user::%user%
::dl::%dl%
::dls::%dls%
::downloads::%downloads%
::pics::%pics%
::pictures::%pictures%
::vids::%vids%
::videos::%videos%
::docs::%docs%
::documents::%documents%
::desktop::%desktop%
::dt::%dt%
::dropbox::%dropbox%
::db::%db%
::googledrive::%googledrive%
::gdrive::%gdrive%
::gd::%gd%
::pfdb::%pfdb%
::dbpf::%dbpf%
::dbsettings::%dbsettings%
::dbpfsettings::%dbpfsettings%
::pfdbsettings::%pfdbsettings%
::texts::%texts%
::books::%books%
::screenshots::%screenshots%
::school::%school%
::st::%st%
::st3::%st3%
::py2::%py2%
::py27::%py27%
::py::%py%
::py3::%py3%
::py34::%py34%
::cs113game::%cs113game%
::javac::%javac%
::allappdata::%allappdata%
::appdataall::%appdataall%
::roamingappdata::%roamingappdata%
::appdataroaming::%appdataroaming%
::rappdata::%rappdata%
::appdatar::%appdatar%
::localappdata::%localappdata%
::appdatalocal::%appdatalocal%
::lappdata::%lappdata%
::appdatal::%appdatal%
::gadgets::%gadgets%
::jetbrains::%jetbrains%
::startup::%startup%
::startup1::%startup1%
::startupall::%startupall%
::allstartup::%allstartup%
::startup2::%startup2%
::startupuser::%startupuser%
::userstartup::%userstartup%
#IfWinActive


;-------------------------------------------------------------------------------
open_file_popup_ctrl_l_focus_address_bar:
{
    Send, !d
    KeyWait, Enter, D

    Sleep, 200
    Send, {Esc}  ; sometimes gets stuck at 'Edit1'.  Esc fixes this and does nothing if it gets stuck where we expect, at ToolbarWindow322
    Sleep, 200
    ControlGetFocus, focused_control_win_explorer, ahk_class #32770
    IfInString, focused_control_win_explorer, ToolbarWindow323
    {
        ToolTip, AHK - Invoked special handling for Ctrl-L
        Send, +{Tab}
        Send, +{Tab}
        Send, +{Tab}
        Send, +{Tab}
        Send, +{Tab}
    }
    Else
        ToolTip, AHK - Did NOT invoke special handling for Ctrl-L

    SetTimer, RemoveToolTip, 5000
    Return
}


win_explorer_ctrl_l_focus_address_bar:
{
    Send, !d
    KeyWait, Enter, D

    Sleep, 200
    Send, {Esc}  ; sometimes gets stuck at 'Edit1'.  Esc fixes this and does nothing if it gets stuck where we expect, at ToolbarWindow322
    Sleep, 200
    ControlGetFocus, focused_control_win_explorer, ahk_class CabinetWClass
    IfInString, focused_control_win_explorer, ToolbarWindow322
    {
        ToolTip, AHK - Invoked special handling for Ctrl-L
        Send, +{Tab}
        Send, +{Tab}
    }
    Else
        ToolTip, AHK - Did NOT invoke special handling for Ctrl-L

    SetTimer, RemoveToolTip, 5000
    Return
}

;--------------------------------------------------------------------------------------------------

; Credit for 'win_explorer_ctrl_shift_f_new_file':
;   I obtained below code from DaveJamesMiller,
;   DaveJamesMiller performed only a minor tweak to code written by aubricus.
;       DaveJamesMiller:    https://gist.github.com/davejamesmiller/1965432
;       aubricus:           https://gist.github.com/aubricus/1148174

win_explorer_ctrl_shift_f_new_file:
{
    ; Get full path from open Explorer window
    WinGetText, FullPath, A

    ; Split up result (it returns paths seperated by newlines)
    StringSplit, PathArray, FullPath, `n

    ; Get first item
    FullPath = %PathArray1%

    ; Clean up result
    FullPath := RegExReplace(FullPath, "(^Address: )", "")
    StringReplace, FullPath, FullPath, `r, , all

    ; Change working directory
    SetWorkingDir, %FullPath%

    ; An error occurred with the SetWorkingDir directive
    If ErrorLevel
        Return

    ; Display input box for filename
    InputBox, UserInput, New File (example: foo.txt), , , 400, 100

    ; User pressed cancel
    If ErrorLevel
        Return

    ; Create file
    FileAppend, , %UserInput%

    Return
}

win_explorer_ctrl_shift_f_new_file_on_desktop:
{
    ; SetWorkingDir, C:\Users\Brian\Desktop
    SetWorkingDir, %HOMEPATH%\Desktop

    ; An error occurred with the SetWorkingDir directive
    If ErrorLevel
        Return

    ; Display input box for filename
    InputBox, UserInput, New File on Desktop (example: foo.txt), , , 400, 100

    ; User pressed cancel
    If ErrorLevel
        Return

    ; Create file
    FileAppend, , %UserInput%

    Return
}

;--------------------------------------------------------------------------------------------------

win_explorer_ctrl_shift_n_new_folder:
{
    Send, ^+n
    Sleep, 500
    ControlGetFocus, focused_control_win_explorer, ahk_class CabinetWClass

    IfInString, focused_control_win_explorer, SysHeader321
    {
        ToolTip, AHK - Invoked special handling for Ctrl-Shift-N
        Send, +{Tab}
        Send, {F2}
    }

    Else
        ToolTip, AHK - Did NOT invoke special handling for Ctrl-Shift-N

    SetTimer, RemoveToolTip, 5000
    Return
}

;--------------------------------------------------------------------------------------------------

RemoveToolTip:
{
    SetTimer, RemoveToolTip, Off
    ToolTip
    Return
}
