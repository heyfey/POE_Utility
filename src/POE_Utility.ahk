#include SearchItemTW.ahk

#IfWinActive, Path of Exile
#SingleInstance force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent ; Stay open in background
#MaxThreadsPerHotkey 2

SetDefaultMouseSpeed, 0

; 設定要撿拾物品的顏色(可用Ctrl + D查詢)
global lootColor = 0x790062 ; for SetTextColor 100 0 122 255

; 設定解析度
global resolutionX = 1600
global resolutionY = 900

; 傳送卷軸的座標(可用Ctrl + D查詢), 在我的畫面中是物品欄的最右下角
global portalX = 1573
global portalY = 665


XButton2::QuickFlask()

QuickFlask(){
    ; Send {1}
    ; Sleep 50
    ; Send {2}
    ; Sleep 50
    Send {3}
    Sleep 50
    Send {4}
    Sleep 50
    Send {5}
    return
}

XButton1::
    Send {3}
    return

~F2::Global("2")

Global(channel){
    BlockInput On
    Send {Enter}
    Clipboard = /global %channel%
    Send ^v
    Send {Enter}
    BlockInput Off
    return
}

~F3::Trade("820")

~F4::Trade("821")

Trade(channel){
    BlockInput On
    Send {Enter}
    Clipboard = /trade %channel%
    Send ^v
    Send {Enter}
    BlockInput Off
    return
}

~F5::HideOut()

HideOut(){
    BlockInput On
    Send {Enter}
    Clipboard = /hideout
    Send ^v
    Send {Enter}
    BlockInput Off
    return
}
   
~^d::CheckMousePos() ; Get mouse position and color.

CheckMousePos(){
    MouseGetPos, MouseX, MouseY
    PixelGetColor, color, %MouseX%, %MouseY%
    MsgBox, x=%MouseX% y=%MouseY% Color=%color%.
    return
}

; Loot one.
~a::
    if !LootSmallRegion(){
        LootBigRegion()
    }
    return


~^a::LootAll()

LootAll(){
    while (GetKeyState("LControl", "P") && GetKeyState("a", "P")){
        if !LootSmallRegion(){
            break
        }
        Sleep 400
    }

    while (GetKeyState("LControl", "P") && GetKeyState("a", "P")){
        LootBigRegion()
        Sleep 1200
        while (GetKeyState("LControl", "P") && GetKeyState("a", "P")){
            if !LootSmallRegion(){
                break
            }
            Sleep 400
        }
    }
}

LootBigRegion(){
    PixelSearch, Px, Py, 100, 100, resolutionX-10, resolutionY-150, lootColor, 5, Fast
    if ErrorLevel{
        return False
    }
    else{
        Click %Px%, %Py%
        return True
    }
}

LootSmallRegion(){
    PixelSearch, Px, Py, 650, 300, 950, 500, lootColor, 5, Fast
    if ErrorLevel{
        return False
    }
    else{
        Click %Px%, %Py%
        return True
    }
}

~^f::OpenPortal()

OpenPortal(){
    BlockInput On
    MouseGetPos x, y
    Send {i}
    Click, %portalX%, %portalY%, right
    Send {i}
    MouseMove, x, y
    BlockInput Off
    return
}

; Quick search item.
~^PgUp::
    temp := Clipboard
    Clipboard := GetItemName()
    if Clipboard !=
        SearchItem()
    Clipboard := temp
    return

