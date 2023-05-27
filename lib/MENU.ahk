#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

IfWinExist, Scan Software
{
    ;~ Creating Menu list for different transactions.
    ; Menu, MyMenu, Add, Open_Program, MenuHandler
    Menu, MyMenu, Add, Scan_Agreement_Paper, MenuHandler
    Menu, MyMenu, Add, Scan_Citizenship, MenuHandler
    Menu, MyMenu, Add, Scan_Other_Docs, MenuHandler
    Menu, MyMenu, Add, Close_Program, MenuHandler
    return

    ^Space::
        Menu, MyMenu, Show
    return

    MenuHandler:
        If (A_ThisMenuItemPos = 1)
        {
            scan_profile(1)
        }
        else if (A_ThisMenuItemPos = 2)
        {
            scan_profile(2)
            ContinueOrEnd()
        }
        else if (A_ThisMenuItemPos = 3)
        {
            scan_profile(3)
            ContinueOrEnd()
        }
        else if (A_ThisMenuItemPos = 4)
        {
            close_app("Scan Software")
        }
    return
}