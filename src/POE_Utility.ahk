#Include functions.ahk
#Include SearchItem.ahk
#Include gui.ahk

#IfWinActive, Path of Exile
#SingleInstance force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent ; Stay open in background
#MaxThreadsPerHotkey 2

SetDefaultMouseSpeed, 0

;===============================================================================
; Settings:
;===============================================================================
; ## 一鍵喝水 
global quickFlasksHotkey0 = "2"
global quickFlasksHotkey1 = "3"

global quick_flask_list = "w-e-2-3-4-5-q"
global quick_flask_list_1 = "3-w"
; This is a sequence of keys to send in QuickFlask, use '-' as a delimiter.
; In my case: "2-3-4-5-q-r"
;     [2, 3, 4, 5]: Utility Flasks 功能藥劑
;     [q]: Phase Run 暗影迷蹤
;     [r]: Blood Rage 鮮血狂怒

; ## 快速撿裝 
; 設定要撿拾物品的顏色(可用Shift + D查詢)
global lootColor = 0x790062 ; for SetBorderColor 100 0 122 255
global loot_dalay = 400

; ## 使用傳送捲軸 
; 傳送卷的座標(可用Shift + D查詢), 在我的畫面中是物品欄的最右下角
global portalX = 1886
global portalY = 807

; ## 低血量時自動喝水
; Auto flask when low life. 
global low_life_X = 169
global low_life_Y = 923
global life_color = 0x180B8F
global low_life_flask_list = "1" ; Keys to send when low life, use '-' as a delimiter.
; In my case: "1-q-w"
;     [1]: Life Flask 生命藥劑
;     [q]: Phase Run 暗影迷蹤
;     [w]: Immortal Call/Enduring Cry 不朽怒嚎/堅決戰吼
global auto_flask_active = False

; ## 自動引爆地雷
; Keep detonating mine when holding right button. 
; Put your arc mine on right button.
; And also put arc mine on another button, in case 
; that you don't want to detonate immediately.
global mine_laying_time = 300 ; ms
global auto_detonate_active = False


; ## 快速查價
; Search item url
; global url = "http://www.pathofexile.com/trade/search/Betrayal" ; International sever
global url = "https://web.poe.garena.tw/trade/search/%E6%8E%98%E7%8D%84%E8%81%AF%E7%9B%9F" ; 台服

global quickEnterText0 = "/global 2"
global quickEnterText1 = "/global 820"
global quickEnterText2 = "/trade 820"
global quickEnterText3 = "/hideout"
global quickEnterText4 = "/global 5587"
global quickEnterText5 = ""
global quickEnterText6 = ""
global quickEnterText7 = "/exit"

;===============================================================================

Hotkey, %quickFlasksHotkey0%, QuickFlaskLabel0
Hotkey, %quickFlasksHotkey1%, QuickFlaskLabel1 

;===============================================================================

RunGUI()

;===============================================================================

QuickFlaskLabel0:
QuickFlask(quick_flask_list) 
return

QuickFlaskLabel1:
QuickFlask(quick_flask_list_1) 
return

~RButton::
AutoDetonate()

~^d::Activate_AutoDetonate()               ; Ctrl+D: 開啟/關閉自動引爆地雷

^f::Activate_AutoFlask()                   ; Ctrl+F: 開啟/關閉自動喝水

XButton2::QuickFlask(quick_flask_list)     ; Side button: 一鍵嗑藥

XButton1::QuickFlask(quick_flask_list_1)

~F2::QuickEnter(quickEnterText0)           ; F2: 世界2
~F3::QuickEnter(quickEnterText1)           ; F3: 交易820
~F4::QuickEnter(quickEnterText2)           ; F4: 交易821
~F5::QuickEnter(quickEnterText3)           ; F5: 進入藏身處
~F6::QuickEnter(quickEnterText4)           ; F6: 世界820
~F7::QuickEnter(quickEnterText5)           ; F7:
~F8::QuickEnter(quickEnterText6)           ; F8:
~^`::QuickEnter(quickEnterText7)           ; Ctrl+~: Exit to char selection

~+d::CheckMousePos()                       ; Shift+D: Get mouse position and color.

~a::                                       ; A: Loot one item.
    if !LootSmallRegion(){
        LootBigRegion()
    }
    return

~^a::LootAll()                             ; Ctrl+A: Hold to keep looting.

~^p::OpenPortal()                          ; Ctrl+F: Use portal scroll 

~^PgUp::QuickSearchItem()                  ; Ctrl+PageUp: Search item on official trade.
