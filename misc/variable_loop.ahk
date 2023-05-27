

iniFilePath := "..\controls.ini"

global window_list = ["MAIN_WINDOW", "WINDOW_SECOND", "WINDOW_THIRD"]

for index, item in window_list
    IniRead, %item%, %iniFilePath%, WINDOW, %item%
    MsgBox, %item%


/*

global window_list = ["MAIN_WINDOW", "WINDOW_SECOND", "WINDOW_THIRD"]

IniRead, MAIN_WINDOW, %iniFilePath%, WINDOW, MAIN_WINDOW
IniRead, WINDOW_SECOND, %iniFilePath%, WINDOW, WINDOW_SECOND
IniRead, WINDOW_THIRD, %iniFilePath%, WINDOW, WINDOW_THIRD

global MAIN_WINDOW
global WINDOW_SECOND

message_all(){
    MsgBox, Second Var: %MAIN_WINDOW%
    MsgBox, Second Var: %WINDOW_SECOND%
    ; MsgBox, %WINDOW_THIRD%
}

message_all()

*/





; global window_list = ["MAIN_WINDOW", "WINDOW_SECOND", "WINDOW_THIRD"]

; for index, variable in window_list
;     IniRead, variable, %iniFilePath%, WINDOW, %variable%


; IniRead, MAIN_WINDOW, %iniFilePath%, WINDOW, MAIN_WINDOW
; MsgBox, The msg is %MAIN_WINDOW%.



; global array := ["CHOOSE_PROFILE", "SINGLE_SCAN", "MULTIPLE_SCAN", "SINGLE_FILE", "FILE_PATH_NAME", "START_BUTTON", "NEXT_SCAN", "FINISH_SCAN"]

; Loop through the variables array to read the values from the INI file and set them as global variables

; Enumerate the array's contents:
; For index, value in array
;     var := %value%
;     MsgBox, %var%


; for index, variable in variables
; {
;     IniRead, variable, %iniFilePath%, OPTION_BUTTON, variable
;     text := variable
;     MsgBox, The variable is %text%.
;     ; global %variable% := %variable%
;     ; %variable% := %variable%
; }


/*
variables := ["CHOOSE_PROFILE", "SINGLE_SCAN", "MULTIPLE_SCAN", "SINGLE_FILE", "FILE_PATH_NAME", "START_BUTTON", "NEXT_SCAN", "FINISH_SCAN"]

; Loop through the variables array to read the values from the INI file and set them as global variables
for index, variable in variables
{
    key := variable
    IniRead, %variable%, %iniFilePath%, OPTION_BUTTON, %key%
    MsgBox, The msg is %variable%.

    ; %variable% := %variable%
}

*/
