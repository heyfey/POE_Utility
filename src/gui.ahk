; Generated using SmartGUI Creator 4.0

RunGUI(){

global
Gui, Font, bold
Gui, Add, Text, x42 y20 w120 h20 +cBlue gGoToWebsite, go to GitHub
Gui, Font, norm
Gui, Add, Edit, x252 y20 w0 h0 , 123 ; dummy edit to avoid a mysterious bug

; quick flasks
; 1
Gui, Font, bold
Gui, Add, GroupBox, x32 y50 w10 h100 , Quick Flasks
Gui, Font, norm
Gui, Add, Hotkey, vquickFlasksHotkey0 x42 y80 w80 h20 , %quickFlasksHotkey0%
Gui, Add, Text, x122 y50 w30 h0 , Text
Gui, Add, Text, x132 y80 w120 h30 , to quick flasks (1)`, list:
Gui, Add, Edit, vquick_flask_list x252 y80 w150 h20 , %quick_flask_list%
; 2
Gui, Add, Hotkey, vquickFlasksHotkey1 x42 y110 w80 h20 , %quickFlasksHotkey1%
Gui, Add, Text, x122 y80 w30 h0 , Text
Gui, Add, Text, x132 y110 w120 h30 , to quick flasks (2)`, list:
Gui, Add, Edit, vquick_flask_list_1 x252 y110 w150 h20 , %quick_flask_list_1%

; auto flasks
Gui, Font, bold
Gui, Add, GroupBox, x32 y160 w380 h160 , Auto Flasks
Gui, Add, Text, x42 y190 w80 h20 , Ctrl + F
Gui, Font, norm
Gui, Add, Text, x132 y190 w70 h30 , to turn on/off`,
Gui, Add, Text, x212 y190 w30 h20 , X:
Gui, Add, Text, x212 y220 w30 h20 , Y:
Gui, Add, Text, x212 y250 w50 h20 , color:
Gui, Add, Text, x212 y280 w30 h20 , list:
Gui, Add, Edit, vlow_life_X x252 y190 w60 h20 , %low_life_X%
Gui, Add, Edit, vlow_life_Y x252 y220 w60 h20 , %low_life_Y%
Gui, Add, Edit, vlife_color x252 y250 w140 h20 , %life_color%
Gui, Add, Edit, vlow_life_flask_list x252 y280 w140 h20 , %low_life_flask_list%

; loot
Gui, Font, bold
Gui, Add, GroupBox, x32 y330 w380 h130 , Loot
Gui, Add, Text, x42 y390 w80 h20 , A
Gui, Add, Text, x42 y420 w80 h20 , Ctrl + A
Gui, Font, norm
Gui, Add, Text, x42 y360 w70 h20 , loot color:
Gui, Add, Edit, vlootColor x102 y360 w100 h20 , %lootColor%
Gui, Add, Text, x132 y390 w100 h20 , to quick loot
Gui, Add, Text, x132 y420 w130 h20 , hold to keep looting`; delay:
Gui, Add, Text, x342 y420 w170 h-10 , (ms)
Gui, Add, Edit, vloot_dalay x272 y420 w50 h20 , %loot_dalay%
Gui, Add, Text, x332 y420 w30 h20 , (ms)

; qucik enter
Gui, Font, bold
Gui, Add, GroupBox, x462 y40 w240 h280 , Quick Enter
Gui, Add, Text, x482 y60 w80 h20 , F2
Gui, Add, Text, x482 y90 w80 h20 , F3
Gui, Add, Text, x482 y120 w80 h20 , F4
Gui, Add, Text, x482 y150 w80 h20 , F5
Gui, Add, Text, x482 y180 w80 h20 , F6
Gui, Add, Text, x482 y210 w80 h20 , F7
Gui, Add, Text, x482 y240 w80 h20 , F8
Gui, Add, Text, x482 y270 w80 h20 , Ctrl + ~
Gui, Font, norm
Gui, Add, Edit, vquickEnterText0 x572 y60 w110 h20 , %quickEnterText0%
Gui, Add, Edit, vquickEnterText1 x572 y90 w110 h20 , %quickEnterText1%
Gui, Add, Edit, vquickEnterText2 x572 y120 w110 h20 , %quickEnterText2%
Gui, Add, Edit, vquickEnterText3 x572 y150 w110 h20 , %quickEnterText3%
Gui, Add, Edit, vquickEnterText4 x572 y180 w110 h20 , %quickEnterText4%
Gui, Add, Edit, vquickEnterText5 x572 y210 w110 h20 , %quickEnterText5%
Gui, Add, Edit, vquickEnterText6 x572 y240 w110 h20 , %quickEnterText6%
Gui, Add, Edit, vquickEnterText7 x572 y270 w110 h20 , %quickEnterText7%

; misc
Gui, Font, bold
Gui, Add, GroupBox, x462 y330 w240 h60 , Misc
Gui, Add, Text, x482 y350 w80 h20 , Shift + D
Gui, Font, norm
Gui, Add, Text, x572 y350 w120 h30 , get [coordinate, color] on cursor

Gui, Add, Button, x582 y480 w100 h30, Apply change

Gui, Show, x127 y91 h546 w722, POE_Utility
Return

GuiClose:
ExitApp

GoToWebsite:
Run https://github.com/heyfey/POE_Utility
return

}

ButtonApplyChange(){
    TurnOffAllHotkey()
    Gui, Submit, NoHide
    TurnOnAllHotkey()
    MsgBox , 0, , change applied, 0.5
}

TurnOffAllHotkey(){
    TurnOffHotkey(quickFlasksHotkey0)
    TurnOffHotkey(quickFlasksHotkey1)
}

TurnOnAllHotkey(){
    TurnOnHotkey(quickFlasksHotkey0, "QuickFlaskLabel0")
    TurnOnHotkey(quickFlasksHotkey1, "QuickFlaskLabel1")
}

TurnOffHotkey(key){
    if %key%{
        Hotkey, %key%, Off
    }
    return
}

TurnOnHotkey(key, label){
    if key{
        Hotkey, %key%, %label%
    }
    else{
        ;Msgbox, %key%
    }
    return
}