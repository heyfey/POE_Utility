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
;     [2, 3, 4, 5]: Utility Flasks 功能藥劑
;     [q]: Phase Run 暗影迷蹤
;     [r]: Blood Rage 鮮血狂怒

; Auto flask when low life. 
; 低血量時自動喝水
global low_life_X = 191
global low_life_Y = 949
global life_color = 0x1C1C54
global low_life_flask_list = "1-q" ; Keys to send when low life, use '-' as a delimiter.
; In my case: "1-q-w"
;     [1]: Life Flask 生命藥劑
;     [q]: Phase Run 暗影迷蹤
;     [w]: Immortal Call/Enduring Cry 不朽怒嚎/堅決戰吼
global auto_flask_active = False

; Keep detonating mine when holding right button. 
; 自動引爆地雷
; Put your arc mine on right button.
; And also put arc mine on another button, in case 
; that you don't want to detonate immediately.
global auto_detonate_active = False
global mine_laying_time = 350 ; ms

; Search item url
; global url = "http://www.pathofexile.com/trade/search/Betrayal" ; International sever
global url = "https://web.poe.garena.tw/trade/search/%E6%8E%98%E7%8D%84%E8%81%AF%E7%9B%9F" ; 台服

;===============================================================================


~RButton::AutoDetonate()

~^d::Activate_AutoDetonate()               ; Ctrl+D: 開啟/關閉自動引爆地雷

~F7::Activate_AutoFlask()                  ; F7: 開啟/關閉自動喝水

XButton2::QuickFlask(quick_flask_list)     ; Side button: 一鍵嗑藥

XButton1::
    return

~F2::QuickEnter("global 2")                ; F2: 世界2

~F3::QuickEnter("trade 820")               ; F3: 交易820

~F4::QuickEnter("trade 821")               ; F4: 交易821

~F5::QuickEnter("hideout")                 ; F5: 進入藏身處

~F6::QuickEnter("global 820")              ; F6: 世界820

~^`::QuickEnter("exit")                    ; Ctrl+~: Exit to char selection
   
~+d::CheckMousePos()                       ; Shift+D: Get mouse position and color.

~a::                                       ; A: Loot one item.
    if !LootSmallRegion(){
        LootBigRegion()
    }
    return

~^a::LootAll()                             ; Ctrl+A: Hold to keep looting.

~^f::OpenPortal()                          ; Ctrl+F: Use portal scroll 

~^PgUp::QuickSearchItem()                  ; Ctrl+PageUp: Search item on official trade.

