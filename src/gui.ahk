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
Gui, Add, GroupBox, x30 y50 w380 h130 , Quick Flasks
Gui, Add, Text, x40 y80 w80 h20 , Ctrl + L
Gui, Font, norm
Gui, Add, Text, x130 y80 w70 h30 , to turn on /off
Gui, Add, Hotkey, vquickFlasksHotkey0 x40 y110 w80 h20 , %quickFlasksHotkey0%
Gui, Add, Text, x120 y80 w30 h0 , Text
Gui, Add, Text, x130 y110 w120 h30 , to quick flasks (1)`, list:
Gui, Add, Edit, vquick_flask_list x250 y110 w150 h20 , %quick_flask_list%
; 2
Gui, Add, Hotkey, vquickFlasksHotkey1 x40 y140 w80 h20 , %quickFlasksHotkey1%
Gui, Add, Text, x120 y110 w30 h0 , Text
Gui, Add, Text, x130 y140 w120 h30 , to quick flasks (2)`, list:
Gui, Add, Edit, vquick_flask_list_1 x250 y140 w150 h20 , %quick_flask_list_1%

; auto flasks
Gui, Font, bold
Gui, Add, GroupBox, x30 y190 w380 h160 , Auto Flasks
Gui, Add, Text, x40 y220 w80 h20 , Ctrl + F
Gui, Font, norm
Gui, Add, Text, x130 y220 w70 h30 , to turn on /off,
Gui, Add, Text, x210 y220 w30 h20 , X:
Gui, Add, Text, x210 y250 w30 h20 , Y:
Gui, Add, Text, x210 y280 w50 h20 , color:
Gui, Add, Text, x210 y310 w30 h20 , list:
Gui, Add, Edit, vlow_life_X x250 y220 w60 h20 , %low_life_X%
Gui, Add, Edit, vlow_life_Y x250 y250 w60 h20 , %low_life_Y%
Gui, Add, Edit, vlife_color x250 y280 w140 h20 , %life_color%
Gui, Add, Edit, vlow_life_flask_list x250 y310 w140 h20 , %low_life_flask_list%

; loot
Gui, Font, bold
Gui, Add, GroupBox, x30 y360 w380 h130 , Loot
Gui, Add, Text, x40 y420 w80 h20 , A
Gui, Add, Text, x40 y450 w80 h20 , Ctrl + A
Gui, Font, norm
Gui, Add, Text, x40 y390 w70 h20 , loot color:
Gui, Add, Edit, vlootColor x100 y390 w100 h20 , %lootColor%
Gui, Add, Text, x130 y420 w100 h20 , to quick loot
Gui, Add, Text, x130 y450 w130 h20 , hold to keep looting`; delay:
Gui, Add, Text, x340 y450 w170 h-10 , (ms)
Gui, Add, Edit, vloot_dalay x270 y450 w50 h20 , %loot_dalay%
Gui, Add, Text, x330 y450 w30 h20 , (ms)

; qucik enter
Gui, Font, bold
Gui, Add, GroupBox, x460 y40 w240 h280 , Quick Enter
Gui, Add, Text, x480 y60 w80 h20 , F2
Gui, Add, Text, x480 y90 w80 h20 , F3
Gui, Add, Text, x480 y120 w80 h20 , F4
Gui, Add, Text, x480 y150 w80 h20 , F5
Gui, Add, Text, x480 y180 w80 h20 , F6
Gui, Add, Text, x480 y210 w80 h20 , F7
Gui, Add, Text, x480 y240 w80 h20 , F8
Gui, Add, Text, x480 y270 w80 h20 , Ctrl + ~
Gui, Font, norm
Gui, Add, Edit, vquickEnterText0 x570 y60 w110 h20 , %quickEnterText0%
Gui, Add, Edit, vquickEnterText1 x570 y90 w110 h20 , %quickEnterText1%
Gui, Add, Edit, vquickEnterText2 x570 y120 w110 h20 , %quickEnterText2%
Gui, Add, Edit, vquickEnterText3 x570 y150 w110 h20 , %quickEnterText3%
Gui, Add, Edit, vquickEnterText4 x570 y180 w110 h20 , %quickEnterText4%
Gui, Add, Edit, vquickEnterText5 x570 y210 w110 h20 , %quickEnterText5%
Gui, Add, Edit, vquickEnterText6 x570 y240 w110 h20 , %quickEnterText6%
Gui, Add, Edit, vquickEnterText7 x570 y270 w110 h20 , %quickEnterText7%

; misc
Gui, Font, bold
Gui, Add, GroupBox, x460 y330 w240 h60 , Misc
Gui, Add, Text, x480 y350 w80 h20 , Shift + D
Gui, Font, norm
Gui, Add, Text, x570 y350 w120 h30 , get [coordinate, color] on cursor

Gui, Add, Button, x580 y480 w100 h30, Apply change

Gui, Show, x127 y91 h546 w722, POE_Utility
Return

GuiClose:
SaveSettings()
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
        Hotkey, %key%, %label%, On
    }
    else{
        ;Msgbox, %key%
    }
    return
}
