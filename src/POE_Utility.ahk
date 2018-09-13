#include SearchItem.ahk

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

; 低血量時自動喝水
global low_life_X = 98
global low_life_Y = 811
global life_color = 0x110C6C
global auto_flask_active = False

; Search url
; url = https://www.pathofexile.com/trade/search/Delve ; International sever
url = https://web.poe.garena.tw/trade/search/%E6%8E%98%E7%8D%84%E8%81%AF%E7%9B%9F ; Taiwan server

~F7::AutoFlask() ; 開啟/關閉自動喝水

AutoFlask(){
    if !auto_flask_active{
        auto_flask_active := True
        MsgBox Auto flask : On
        Active()
    }
    else{
        auto_flask_active := False
        MsgBox Auto flask : Off
    }
}

Active(){
    while auto_flask_active
    {
        if WinActive("Path of Exile")
        {
            PixelGetColor, color, low_life_X, low_life_Y
            if color != %life_color%
            {
                Send {1} ; 生命藥劑
                ; Sleep 50
                ; Send {w} ; 不朽怒嚎/堅決戰吼
                Sleep 200
            }
        }
    }
}

XButton2::QuickFlask()

QuickFlask(){
    ; Send {1}
    ; Sleep 50
    Send {2} ; 2, 3, 4, 5是藥水
    Sleep 50
    Send {3}
    Sleep 50
    Send {4}
    Sleep 50
    Send {5}
    Sleep 50
    Send {q} ; 暗影迷蹤
    Sleep 50
    Send {r} ; 鮮血狂怒
    return
}

XButton1::
    send {q}
    Send {3}
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
        SearchItem(url)
    Clipboard := temp
    return

