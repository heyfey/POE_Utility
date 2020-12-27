ReadSettings(){
    IniRead, quickFlasksHotkey0,  settings.ini, settings, quickFlasksHotkey0,  2
    IniRead, quickFlasksHotkey1,  settings.ini, settings, quickFlasksHotkey1,  3
    IniRead, quick_flask_list,    settings.ini, settings, quick_flask_list,    w-e-2-3-4-5-q
    IniRead, quick_flask_list_1,  settings.ini, settings, quick_flask_list_1,  3-w
    IniRead, lootColor,           settings.ini, settings, lootColor,           0x790062
    IniRead, loot_dalay,          settings.ini, settings, loot_dalay,          400
    IniRead, portalX,             settings.ini, settings, portalX,             1889
    IniRead, portalY,             settings.ini, settings, portalY,             607
    IniRead, low_life_X,          settings.ini, settings, low_life_X,          169
    IniRead, low_life_Y,          settings.ini, settings, low_life_Y,          923
    IniRead, life_color,          settings.ini, settings, life_color,          0x180B8F    
    IniRead, low_life_flask_list, settings.ini, settings, low_life_flask_list, 1
    IniRead, quickEnterText0,     settings.ini, settings, quickEnterText0,     /global 2
    IniRead, quickEnterText1,     settings.ini, settings, quickEnterText1,     /global 820
    IniRead, quickEnterText2,     settings.ini, settings, quickEnterText2,     /trade 820
    IniRead, quickEnterText3,     settings.ini, settings, quickEnterText3,     /hideout
    IniRead, quickEnterText4,     settings.ini, settings, quickEnterText4,     /global 5587
    IniRead, quickEnterText5,     settings.ini, settings, quickEnterText5,     %A_Space%
    IniRead, quickEnterText6,     settings.ini, settings, quickEnterText6,     %A_Space%
    IniRead, quickEnterText7,     settings.ini, settings, quickEnterText7,     /exit
    IniRead, mine_laying_time,    settings.ini, settings, mine_laying_time,    300
    ; IniRead, url,                 settings.ini, settings, url, http://www.pathofexile.com/trade/search/Betrayal
    IniRead, url,                 settings.ini, settings, url, https://web.poe.garena.tw/trade/search/%E6%8E%98%E7%8D%84%E8%81%AF%E7%9B%9F
    return
}

SaveSettings(){
    IniWrite, %quickFlasksHotkey0%,  settings.ini, settings, quickFlasksHotkey0
    IniWrite, %quickFlasksHotkey1%,  settings.ini, settings, quickFlasksHotkey1
    IniWrite, %quick_flask_list%,    settings.ini, settings, quick_flask_list
    IniWrite, %quick_flask_list_1%,  settings.ini, settings, quick_flask_list_1
    IniWrite, %lootColor%,           settings.ini, settings, lootColor
    IniWrite, %loot_dalay%,          settings.ini, settings, loot_dalay
    IniWrite, %portalX%,             settings.ini, settings, portalX
    IniWrite, %portalY%,             settings.ini, settings, portalY
    IniWrite, %low_life_X%,          settings.ini, settings, low_life_X
    IniWrite, %low_life_Y%,          settings.ini, settings, low_life_Y
    IniWrite, %life_color%,          settings.ini, settings, life_color
    IniWrite, %low_life_flask_list%, settings.ini, settings, low_life_flask_list
    IniWrite, %quickEnterText0%,     settings.ini, settings, quickEnterText0
    IniWrite, %quickEnterText1%,     settings.ini, settings, quickEnterText1
    IniWrite, %quickEnterText2%,     settings.ini, settings, quickEnterText2
    IniWrite, %quickEnterText3%,     settings.ini, settings, quickEnterText3
    IniWrite, %quickEnterText4%,     settings.ini, settings, quickEnterText4
    IniWrite, %quickEnterText5%,     settings.ini, settings, quickEnterText5
    IniWrite, %quickEnterText6%,     settings.ini, settings, quickEnterText6
    IniWrite, %quickEnterText7%,     settings.ini, settings, quickEnterText7
    IniWrite, %mine_laying_time%,    settings.ini, settings, mine_laying_time
    IniWrite, %url%,                 settings.ini, settings, url
    return
}