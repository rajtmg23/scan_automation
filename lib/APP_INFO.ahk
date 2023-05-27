#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
SetTitleMatchMode, 2


; MAIN_WIN_TITLE := "Not Another PDF Scanner 2"
; MAIN_WIN_TITLE := Notepad


define_program_name(program_name){
    WinSetTitle, %program_name%, , Scan Software
    ; WinSet, Style, ^0xC00000, New Program Name
    WinMove, Scan Software, , -1000, -1000, 200, 200
    Return
}

; hide_info("Not Another PDF Scanner 2")
