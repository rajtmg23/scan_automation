#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Construct the full path to the INI file using the script directory
iniFilePath := A_ScriptDir . "\controls.ini"

; Read variables from the INI file
; ####### FOR WINDOW SECTION ###############
IniRead, MAIN_WINDOW, %iniFilePath%, WINDOW, MAIN_WINDOW
IniRead, MAIN_WINDOW, %iniFilePath%, WINDOW, WINDOW_SECOND
IniRead, MAIN_WINDOW, %iniFilePath%, WINDOW, WINDOW_THIRD

; ######### FOR BUTTONS SECTION ############
; Define the variable names and key names
variables := ["CHOOSE_PROFILE", "SINGLE_SCAN", "MULTIPLE_SCAN", "SINGLE_FILE", "FILE_PATH_NAME", "START_BUTTON", "NEXT_SCAN", "FINISH_SCAN"]

; Loop through the variables array to read the values from the INI file and set them as global variables
for index, variable in variables
{
    key := variable
    IniRead, %variable%, %iniFilePath%, OPTION_BUTTON, %key%
    global %variable% := %variable%
    ; %variable% := %variable%
}





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


