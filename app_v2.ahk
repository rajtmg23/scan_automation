#SingleInstance, Force
; #NoTrayIcon

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetKeyDelay, -1
SetDefaultMouseSpeed, 0
SetMouseDelay, -1
SetControlDelay, -1
SetWinDelay, -1
SetBatchLines, -1
SetTitleMatchMode, 2

#Include <FUNCTIONS>
#Include <MENU>

; if !FileExist("C:\Scan\Soft\win_32.dll")
;     {
;         MsgBox,  , INFO, Key File Missing.
;         ExitApp
;     }


open_app("Scan Software")

Gui +Resize +ToolWindow +AlwaysOnTop

Gui Add, Button, x10 y10 w60 h23 gExecuteFunction1, Agreement
Gui Add, Button, x80 y10 w60 h23 gExecuteFunction2, Citizenship
Gui Add, Button, x150 y10 w60 h23 gExecuteFunction3, Others
Gui Add, Button, x220 y10 w60 h20 gGuiClose, Close

; Get the screen dimensions
ScreenWidth := A_ScreenWidth
ScreenHeight := A_ScreenHeight

; Calculate the desired x and y coordinates
GuiX := 0
GuiY := ScreenHeight - 150

Gui Show, w220 h40 x%GuiX% y%GuiY%, Scan Documents
return

GuiClose:
    close_app("Scan Software")
    ExitApp
return

ExecuteFunction1:
    ; Action for Button 1
    scan_profile(1)
    ; MsgBox, , INFO, Button 1 was clicked!
return

ExecuteFunction2:
    ; Action for Button 2
    scan_profile(2)
    ContinueOrEnd()
    ; MsgBox, , INFO, Button 2 was clicked!
return

ExecuteFunction3:
    ; Action for Button 3
    scan_profile(3)
    ContinueOrEnd()
    ; MsgBox, , INFO, Button 3 was clicked!
return

#z::ExitApp
