#Include functions.ahk
#include SearchItem.ahk

#IfWinActive, Path of Exile
#SingleInstance force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent ; Stay open in background
#MaxThreadsPerHotkey 2

SetDefaultMouseSpeed, 0

;===============================================================================
; Settings:
;===============================================================================
; 設定要撿拾物品的顏色(可用Shift + D查詢)
global lootColor = 0x790062 ; for SetBorderColor 100 0 122 255

; 傳送卷軸的座標(可用Shift + D查詢), 在我的畫面中是物品欄的最右下角
global portalX = 1886
global portalY = 807

global quick_flask_list = "2-3-4-5-q-r"
; This is a sequence of keys to send in QuickFlask, use '-' as a delimiter.
; In my case: "2-3-4-5-q-r"
;     [2, 3, 4, 5]: Utility Flasks (功能藥劑)
;     [q]: Phase Run (暗影迷蹤) 
;     [r]: Blood Rage (鮮血狂怒)

; Auto flask when low life. 
; 低血量時自動喝水
global low_life_X = 182
global low_life_Y = 970
global life_color = 0x161350
global low_life_flask_list = "1-q" ; Keys to send when low life, use '-' as a delimiter.
; In my case: "1-q-w"
;     [1]: Life Flask (生命藥劑)
;     [q]: Phase Run (暗影迷蹤) 
;     [w]: Immortal Call/Enduring Cry (不朽怒嚎/堅決戰吼)
global auto_flask_active = False

; Auto detonate mine when pushing right button. 
; 自動引爆地雷
global auto_detonate_active = False

; Search item url
; global url = "https://www.pathofexile.com/trade/search/Delve" ; International sever
global url = "https://web.poe.garena.tw/trade/search/%E6%8E%98%E7%8D%84%E8%81%AF%E7%9B%9F" ; 台服

;===============================================================================


~RButton::AutoDetonate()

~^d::Activate_AutoDetonate() ; 開啟/關閉自動引爆地雷

~F7::Activate_AutoFlask() ; 開啟/關閉自動喝水

XButton2::QuickFlask(quick_flask_list)

XButton1::
    return

~F2::QuickEnter("global 2")

~F3::QuickEnter("trade 820") ; 換圖頻道

~F4::QuickEnter("trade 821")

~F5::QuickEnter("hideout") ; 進入藏身處

~F6::QuickEnter("global 820") ; 換圖頻道

~^`::QuickEnter("exit") ; Exit to char selection
   
~+d::CheckMousePos() ; Get mouse position and color.

; Loot one.
~a::
    if !LootSmallRegion(){
        LootBigRegion()
    }
    return

~^a::LootAll()

~^f::OpenPortal()

~^PgUp::QuickSearchItem()

