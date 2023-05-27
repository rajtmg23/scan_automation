#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Construct the full path to the INI file using the script directory
iniFilePath := ".\controls.ini"

; Read variables from the INI file
; ####### FOR WINDOW SECTION ###############
IniRead, MAIN_WINDOW, %iniFilePath%, WINDOW, MAIN_WINDOW
IniRead, WINDOW_SECOND, %iniFilePath%, WINDOW, WINDOW_SECOND
IniRead, WINDOW_THIRD, %iniFilePath%, WINDOW, WINDOW_THIRD



; ######### FOR BUTTONS SECTION ############
IniRead, CHOOSE_PROFILE, %iniFilePath%, BUTTON_OPTION, CHOOSE_PROFILE
IniRead, SINGLE_SCAN, %iniFilePath%, BUTTON_OPTION, SINGLE_SCAN
IniRead, MULTIPLE_SCAN, %iniFilePath%, BUTTON_OPTION, MULTIPLE_SCAN
IniRead, SINGLE_FILE, %iniFilePath%, BUTTON_OPTION, SINGLE_FILE
IniRead, FILE_PATH_NAME, %iniFilePath%, BUTTON_OPTION, FILE_PATH_NAME
IniRead, START_BUTTON, %iniFilePath%, BUTTON_OPTION, START_BUTTON
IniRead, NEXT_SCAN, %iniFilePath%, BUTTON_OPTION, NEXT_SCAN
IniRead, FINISH_SCAN, %iniFilePath%, BUTTON_OPTION, FINISH_SCAN


; ####### ASSIGNING AS GLOBAL VARIABLES ##########
global MAIN_WINDOW
global WINDOW_SECOND
global WINDOW_THIRD

global CHOOSE_PROFILE
global SINGLE_SCAN
global MULTIPLE_SCAN
global SINGLE_FILE
global FILE_PATH_NAME
global START_BUTTON

global NEXT_SCAN
global FINISH_SCAN



/*

global MAIN_WINDOW := "Scan Software"
global WINDOW_SECOND := "Batch Scan"
global WINDOW_THIRD := "Next Scan"

global CHOOSE_PROFILE := "WindowsForms10.COMBOBOX.app.0.212cd02_r6_ad11"
global SINGLE_SCAN := "WindowsForms10.BUTTON.app.0.212cd02_r6_ad110"
global MULTIPLE_SCAN := "WindowsForms10.BUTTON.app.0.212cd02_r6_ad18"
global SINGLE_FILE := "WindowsForms10.BUTTON.app.0.212cd02_r6_ad16"
global FILE_PATH_NAME := "WindowsForms10.EDIT.app.0.212cd02_r6_ad11"
global START_BUTTON := "WindowsForms10.BUTTON.app.0.212cd02_r6_ad113"

global NEXT_SCAN := "WindowsForms10.BUTTON.app.0.7afcd6_r6_ad12"
global FINISH_SCAN := "WindowsForms10.BUTTON.app.0.7afcd6_r6_ad11"

*/

open_app(win_title){
    IfWinNotExist, %win_title%
    {
        Run, C:\Program Files (x86)\NAPS2\NAPS2.exe
        WinWait, Not Another PDF Scanner 2
        WinGetTitle, Title
        ; MsgBox, The second window is %WINDOW_SECOND%.
        WinSetTitle, %Title%, , %win_title%
        WinMove, %win_title%, , -1000, -1000, 200, 200
        ; WinSet, ExStyle, +0x80, %Title%  ; Hide the window from the taskbar
    }
}

close_app(win_title){
    IfWinExist, %win_title%
    {
        WinClose, %win_title%
    }
}


scan_profile(profileNum) {
    WinActivate, %MAIN_WINDOW%
    Send, "^b"
    WinWait, %WINDOW_SECOND%
    Control, Choose, %profileNum%, %CHOOSE_PROFILE%, %WINDOW_SECOND%
    Sleep, 100

    if (profileNum = 1) {
        profileName := "Agreement"
        ControlClick, %SINGLE_SCAN%, %WINDOW_SECOND%,, Left, 1,  NA
    } else {
        profileName := (profileNum = 2) ? "Ctz" : "Doc"
        ControlClick, %MULTIPLE_SCAN%, %WINDOW_SECOND%,, Left, 1,  NA
    }

    ControlClick, %SINGLE_FILE%, %WINDOW_SECOND%,, Left, 1,  NA
    Sleep, 100
    ControlSetText, %FILE_PATH_NAME%, C:\Scan\%profileName%-$(nnn).pdf, %WINDOW_SECOND%
    Sleep, 100
    ; ControlClick, %START_BUTTON%, %WINDOW_SECOND%,, Left, 1,  NA
    MsgBox, , INFO, Start Button Clicked.
    WinClose, %WINDOW_SECOND%
}


ContinueOrEnd() {
    IfWinExist, %WINDOW_THIRD%
    {
        MsgBox, 4,, Scan Next page..
        IfMsgBox Yes
        {
            ; Perform certain action here
            ControlClick, %NEXT_SCAN%, %WINDOW_THIRD%,, Left, 1, NA
            ContinueOrEnd()
            ; MsgBox, The process will continue.
        }
        else
        {
            ; Close the specific window here
            ControlClick, %FINISH_SCAN%, %WINDOW_THIRD%,, Left, 1, NA
            WinClose, %WINDOW_THIRD%
            WinClose, %WINDOW_SECOND%
        }
    }
}


