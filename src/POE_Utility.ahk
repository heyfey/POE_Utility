#include SearchItem.ahk

#IfWinActive, Path of Exile
#SingleInstance force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent ; Stay open in background
#MaxThreadsPerHotkey 2

SetDefaultMouseSpeed, 0

; 設定要撿拾物品的顏色(可用Ctrl + D查詢)
global lootColor = 0x790062 ; for SetTextColor 100 0 122 255

; 傳送卷軸的座標(可用Ctrl + D查詢), 在我的畫面中是物品欄的最右下角
global portalX = 1573
global portalY = 665

global quick_flask_list = "2-3-4-5-q-r"
; This is a sequence of keys to send in QuickFlask, use '-' as a delimiter.
; In my case: "2-3-4-5-q-r"
;     2, 3, 4, 5 : Utility Flasks (功能藥劑)
;     q : Phase Run (暗影迷蹤) 
;     r : Blood Rage (鮮血狂怒)

; Auto flask when low life. 低血量時自動喝水
global low_life_X = 149
global low_life_Y = 796
global life_color = 0x1C1770
global auto_flask_active = False
global low_life_flask_list = "1-q" ; Keys to send when low life, use '-' as a delimiter.
; In my case: "1-q-w"
;     1 : Life Flask (生命藥劑)
;     q : Phase Run (暗影迷蹤) 
;     w : Immortal Call/Enduring Cry (不朽怒嚎/堅決戰吼)

; Search url
; url = https://www.pathofexile.com/trade/search/Delve ; International sever (國際服)
url = https://web.poe.garena.tw/trade/search/%E6%8E%98%E7%8D%84%E8%81%AF%E7%9B%9F ; Taiwan server (台服)


~F7::AutoFlask() ; 開啟/關閉自動喝水

AutoFlask(){
    auto_flask_active := !auto_flask_active
    if auto_flask_active{
        MsgBox Auto flask : On
        Active()
    }
    else{
        MsgBox Auto flask : Off
    }
    return
}

Active(){
    while auto_flask_active
    {
        if WinActive("Path of Exile")
        {
            PixelGetColor, color, low_life_X, low_life_Y
            if color != %life_color%
            {
                QuickFlask(low_life_flask_list)
                Sleep 150
            }
        }
    }
    return
}

XButton2::QuickFlask(quick_flask_list)

QuickFlask(list){
    Loop, parse, list, -
    {
        Send {%A_LoopField%}
        Sleep 50
    }
    return
}

XButton1::
    return

~F2::QuickEnter("global 2")

~F3::QuickEnter("trade 820") ; 換圖頻道

~F4::QuickEnter("trade 821")

~F5::QuickEnter("hideout") ; 進入藏身處

~F6::QuickEnter("global 820") ; 換圖頻道

QuickEnter(channel){
    BlockInput On
    temp := Clipboard
    Send {Enter}
    Clipboard = /%channel%
    Send ^v
    Send {Enter}
    Clipboard := temp
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
    PixelSearch, Px, Py, 100, 100, A_ScreenWidth-10, A_ScreenHeight-150, lootColor, 5, Fast
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
        SearchItem(url)
    Clipboard := temp
    return

