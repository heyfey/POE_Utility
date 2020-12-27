AutoDetonate(){
    if auto_detonate_active{
        while (GetKeyState("RButton", "P")){
            Send {RButton}
            Sleep mine_laying_time
            Send {d}
            Random, rand, 10, 40
            Sleep rand
        }
    }
    else{
    }
}

Activate_AutoDetonate(){
    auto_detonate_active := !auto_detonate_active
    if auto_detonate_active{
        MsgBox , 0, , Auto Detonate : On, 0.5
    }
    else{
        MsgBox , 0, , Auto Detonate : Off, 0.5
    }
    return
}

Activate_AutoFlask(){
    auto_flask_active := !auto_flask_active
    if auto_flask_active{
        MsgBox , 0, , Auto flask : On, 0.5
        AutoFlask()
    }
    else{
        MsgBox , 0, , Auto flask : Off, 0.5
    }
    return
}

AutoFlask(){
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

QuickFlask(list){
    Loop, parse, list, -
    {
        Send {%A_LoopField%}
        Sleep 50
    }
    return
}

QuickEnter(channel){
    if channel {
        BlockInput On
        temp := Clipboard
        Clipboard := channel
        ClipWait 
        Send {Enter}
        Send ^v
        Send {Enter}
        Sleep 100
        Clipboard := temp
        ClipWait
        BlockInput Off
    }
    return
}

CheckMousePos(){
    MouseGetPos, MouseX, MouseY
    PixelGetColor, color, %MouseX%, %MouseY%
    MsgBox, x=%MouseX% y=%MouseY% Color=%color%.
    return
}

LootBigRegion(){
    PixelSearch, Px, Py, 100, 100, A_ScreenWidth-10, A_ScreenHeight-150, lootColor, 5, Fast
    if ErrorLevel{
        return False
    }
    else{
        Px := Px + 10
        Py := Py + 10
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
        Px := Px + 10
        Py := Py + 10
        Click %Px%, %Py%
        return True
    }
}

LootAll(){
    while (GetKeyState("LControl", "P") && GetKeyState("a", "P")){
        if !LootSmallRegion(){
            break
        }
        Sleep loot_dalay
    }

    while (GetKeyState("LControl", "P") && GetKeyState("a", "P")){
        LootBigRegion()
        Sleep 1200
        while (GetKeyState("LControl", "P") && GetKeyState("a", "P")){
            if !LootSmallRegion(){
                break
            }
            Sleep loot_dalay
        }
    }
}

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

QuickSearchItem(){
    temp := Clipboard
    Clipboard := GetItemName()
    if Clipboard !=
        SearchItem(url)
    Clipboard := temp
    return
}

