; v5
; Previous version had an inherent flaw from the beginning:
; From AHK website: "#Include cannot be executed conditionally"
; That is, all the #Include's were always executed, regardless
; of whether or not there was a corresponding Gosub or not.
; This version fixes that issue.
;
; Source for original (flawed) script
; http://www.autohotkey.com/board/topic/5119-launching-multiple-ahk-scripts/
;
; Source for #Include reference
; http://www.autohotkey.com/docs/commands/_Include.htm

;----- Common settings -----
#SingleInstance, Force
#Persistent
StringCaseSense On
AutoTrim OFF
Process Priority,,High

SetWinDelay, 			15
SetKeyDelay, 			10
SetMouseDelay,			10
SetDefaultMouseSpeed, 	0
SetBatchLines, 			15ms

JoyStickNumber = 1
GetKeyState, number_joy_buttons, %JoyStickNumber%JoyButtons
ToolTip, AHK - Found %number_joy_buttons% gamepad buttons, A_ScreenWidth/2, A_ScreenHeight/2
SetTimer, RemoveToolTip, 5000

SetTitleMatchMode, 2  ; match if anywhere in title
Menu, Tray, Icon, compstui.dll, 52


;----- Your autoexecute commands -----
;...


;----- Included scripts -----
CAPSLOCK_KEY_MODIFIED:
#Include, _global_hotkey_ctrl_capslock_as_capslock.ahk

INSERT_KEY_MODIFIED:
#Include, _global_hotkey_ctrl_insert_as_insert.ahk

DROPBOX_GDRIVE_ICLOUD_PROCESS_TOGGLE:
#Include, dropbox_gdrive_icloud_process_toggles.ahk

WINDOWS_KEY_MODIFIED:
#Include, _global_hotkey_win_[up_down_left_right].ahk

ADOBE_ACROBAT_HIGHLIGHTING:
#Include, acrobat_hotkeys_highlighting.ahk

ECLIPSE:
#Include, eclipse_hotkeys.ahk

GOOGLE_CHROME_AND_MOZILLA_FIREFOX:
#Include, google_chrome_and_mozilla_firefox_hotkeys.ahk

MS_OFFICE_2013:
#Include, ms_office_hotkeys.ahk

CMD_OPEN_TO_DESKTOP_DIRECTORY:
#Include, _global_hotkey_ctrl_alt_t_open_cmd.ahk

GIT_BASH:
#Include, git_bash_hotkeys.ahk

MS_CMD:
#Include, ms_cmd_hotkeys.ahk

MS_PS:
#Include, ms_ps_hotkeys.ahk

MS_EXPLORER:
#Include, ms_explorer_hotkeys.ahk

LOGITECH_GAMEPAD_AS_REMOTE_WITH_MPC_HC_PLAYER:
#Include, gamepad_remote_mpc_hc_player.ahk


;----- Shared subroutines, functions -----
;...
