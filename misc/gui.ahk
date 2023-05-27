#Include, app_v2.ahk

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

Gui Show, w220 h40 x%GuiX% y%GuiY%, Scan Software
return

GuiClose:
    ExitApp
return

ExecuteFunction1:
    ; Perform action for Button 1
    MsgBox, , INFO, Button 1 was clicked!
return

ExecuteFunction2:
    ; Perform action for Button 2
    MsgBox, , INFO, Button 2 was clicked!
return

ExecuteFunction3:
    ; Perform action for Button 3
    MsgBox, , INFO, Button 3 was clicked!
return
