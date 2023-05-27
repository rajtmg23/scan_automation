SetWorkingDir, %A_ScriptDir%

Gui +Resize +ToolWindow +AlwaysOnTop
/*
Gui Add, Button, x10 y10 w60 h20 gExecuteFunction1 +Icon(Button1.ico)
Gui Add, Button, x80 y10 w60 h20 gExecuteFunction2 +Icon(Button2.ico)
Gui Add, Button, x150 y10 w60 h20 gExecuteFunction3 +Icon(Button3.ico)
*/

Gui Add, Button, x10 y10 w60 h60 gExecuteFunction1 Icon, %A_ScriptDir%\Button1.ico
Gui Add, Button, x80 y10 w60 h60 gExecuteFunction2 Icon, %A_ScriptDir%\Button2.ico
Gui Add, Button, x150 y10 w60 h60 gExecuteFunction3 Icon, %A_ScriptDir%\Button3.ico
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
