variables := ["CHOOSE_PROFILE", "SINGLE_SCAN", "MULTIPLE_SCAN", "SINGLE_FILE", "FILE_PATH_NAME", "START_BUTTON", "NEXT_SCAN", "FINISH_SCAN"]

; Loop through the variables array to read the values from the INI file and set them as global variables
for index, variable in variables
{
    key := variable
    IniRead, %variable%, %iniFilePath%, OPTION_BUTTON, %key%
    MsgBox, The msg is %variable%.

    ; %variable% := %variable%
}
