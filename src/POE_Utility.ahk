#Include functions.ahk
#Include SearchItem.ahk
#Include gui.ahk
#Include rw_settings.ahk

#IfWinActive, Path of Exile
#SingleInstance force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent ; Stay open in background
#MaxThreadsPerHotkey 2

SetDefaultMouseSpeed, 0

global quickFlasksHotkey0
global quickFlasksHotkey1

global quick_flask_list
global quick_flask_list_1

global quick_flask_active = True

global lootColor
global loot_dalay

global portalX
global portalY

global low_life_X
global low_life_Y
global life_color
global low_life_flask_list
global auto_flask_active = False

global mine_laying_time
global auto_detonate_active = False

global url

global quickEnterText0
global quickEnterText1
global quickEnterText2
global quickEnterText3
global quickEnterText4
global quickEnterText5
global quickEnterText6
global quickEnterText7

;===============================================================================

ReadSettings()

Hotkey, %quickFlasksHotkey0%, QuickFlaskLabel0
Hotkey, %quickFlasksHotkey1%, QuickFlaskLabel1 

RunGUI()

;===============================================================================

QuickFlaskLabel0:
    if quick_flask_active{
        QuickFlask(quick_flask_list)
    }
    else{
        Send, %quickFlasksHotkey0%
    }
    return

QuickFlaskLabel1:
    if quick_flask_active{
        QuickFlask(quick_flask_list_1)
    }
    else{
        Send, %quickFlasksHotkey1%
    }
    return

~^l::Activate_QuickFlask()                 ; Ctrl+L: 開啟/關閉一鍵喝水

~RButton::AutoDetonate()

~^d::Activate_AutoDetonate()               ; Ctrl+D: 開啟/關閉自動引爆地雷

^f::Activate_AutoFlask()                   ; Ctrl+F: 開啟/關閉自動喝水

XButton2::QuickFlask(quick_flask_list)     ; Side button: 一鍵嗑藥

XButton1::QuickFlask(quick_flask_list_1)

~F2::QuickEnter(quickEnterText0)           ; F2
~F3::QuickEnter(quickEnterText1)           ; F3
~F4::QuickEnter(quickEnterText2)           ; F4
~F5::QuickEnter(quickEnterText3)           ; F5
~F6::QuickEnter(quickEnterText4)           ; F6
~F7::QuickEnter(quickEnterText5)           ; F7
~F8::QuickEnter(quickEnterText6)           ; F8
~^`::QuickEnter(quickEnterText7)           ; Ctrl+~

~+d::CheckMousePos()                       ; Shift+D: Get mouse position and color.

~a::                                       ; A: Loot one item.
    if !LootSmallRegion(){
        LootBigRegion()
    }
    return

~^a::LootAll()                             ; Ctrl+A: Hold to keep looting.

~^j::OpenPortal()                          ; Ctrl+J: Use portal scroll 

~^PgUp::QuickSearchItem()                  ; Ctrl+PageUp: Search item on official trade.
