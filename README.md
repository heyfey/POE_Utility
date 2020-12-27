
[English guide](https://github.com/heyfey/POE_Utility/blob/master/README-EN.md)

---

**POE-Utility**
是一份AHK腳本，提供了一系列POE的快捷鍵包括：一鍵喝水、快速撿裝、自動喝水/引爆地雷、切換頻道等等。
並且根據實際需求，持續擴充當中。

---
#### 免責聲明 ####

此腳本的許多功能**絕對違反**遊戲規章，使用此程式者請自行承擔所有可能後果和風險>>>[可以參考這裡](https://www.ptt.cc/bbs/PathofExile/M.1536799446.A.BB1.html)

---

#### 快捷鍵 ####

|Shortcut|Description|
|---    |---    |
| `2`，`3`，`滑鼠側鍵`      | 一鍵喝水
| `A`      | 快速撿裝
| `Ctrl + A`      | "按住"持續撿取物品
| `Ctrl + P`      | 使用傳送卷軸 
| `Ctrl + D`      | 開啟/關閉自動引爆地雷
| `Ctrl + F`      | 開啟/關閉自動喝水
| `Ctrl + PageUp`      | 在賣場查詢游標上的物品，如果沒有則用"輸入"查詢
| `F2 ~ F8`，`Ctrl + ~` | 快速輸入 |
| `Shift + D`      | 取得游標座標, 顏色

---

#### 如何使用 ####

1. `Clone or download`下載本專案所有原始碼

2. 以系統管理員身分執行 `POE_Utility.exe`

~~1. 下載並安裝[AutoHotKey](https://www.autohotkey.com/)。如果會閃退或沒反應，試試看版本號 `AutoHotkey_1.1.28.02`~~

~~2. `Clone or download`下載本專案所有原始碼~~

~~3. 以系統管理員身分執行 `POE_Utility.ahk`~~

---

#### 預覽 ####

![](https://i.imgur.com/KKYFncG.png)

#### 一鍵嗑藥 quick flasks ####

+ 一鍵喝水和自動喝水兩個功能，在不同的角色配置應該要有不同的設定。

+ **list**是想要快速發送的按鍵序列，用`-`做分隔

+ 按鍵可以是藥水也可以是技能。比如`2-3-4-5-q-w-e`：`2345`是功能藥水，`q`是鋼筋鐵骨，`w`是鮮血狂怒，`e`是暗影迷蹤。建議在此功能中只使用**瞬發**的技能，不然可能有點蠢。

<blockquote class="imgur-embed-pub" lang="en" data-id="a/yp8D0kz"  ><a href="//imgur.com/a/yp8D0kz">quick flask demo</a></blockquote>

![](https://imgur.com/8lDp650)

#### 自動喝水 auto flasks ####

1. 用滑鼠指著想要自動喝水的血線，用`Shift + D`得到滑鼠座標和顏色；建議指著血條時盡量靠右，避免礦坑的特效影響到系統判斷

2. 在主視窗設定座標(X, Y)、顏色、和list(用`-`做分隔)

3. 在遊戲裡`Ctrl + F`開啟/關閉自動喝水

<blockquote class="imgur-embed-pub" lang="en" data-id="a/a79rwEU"  ><a href="//imgur.com/a/a79rwEU">auto flask demo</a></blockquote>

#### 快速撿裝 quick loot ####

+ 運作原理：AHK會在畫面中搜尋並點選指定"顏色"的pixel，搭配過濾器來顯示指定的顏色。

+ 打開你的過濾器，在想要快撿的物品加上`SetBorderColor 100 0 122 255`就行了。

+ 也可以直接使用我們提供的兩種過濾器(修改自[NeverSink](https://github.com/NeverSinkDev/NeverSink-Filter))，快速撿取包含：

   + **NeverSink's filter - 2-SEMI-STRICT(forQuickLoot)**： 卷軸以外的通貨、六洞裝、地圖、預言、化石、有價命運卡
   
   + **NeverSink's filter - 3-STRICT(forQuickLoot)**： 價值**0.5C**以上的通貨、六洞裝、地圖、預言、化石、有價命運卡

<blockquote class="imgur-embed-pub" lang="en" data-id="a/ZtkeSUo"  ><a href="//imgur.com/a/ZtkeSUo">quick loot demo</a></blockquote>


#### 自動引爆地雷 ####

+ 把電弧地雷設定在右鍵，然後`Ctrl+D`開啟自動引爆，就可以按著右鍵持續**放置->引爆**地雷；可以在另一個按鍵也設一個電弧地雷，用在不需要立刻引爆的時候。

+ `POE_Utility.ahk`中的`mine_laying_time = 350`是用來設定引爆的間隔(單位:ms)，可以多試幾次找到最適合自己的值。500大約是8等第一次裝上地雷的時候，350是成形後沒拿地雷杖的速度，拿地雷杖則可以更快。

#### 使用傳送捲 ####

#### 進階設定 ####

所有的基本設定以及修改綁定按鍵都可以在`POE_Utility.ahk`中完成。
如果有需要修改綁定按鍵，可以參考[AHK按鍵列表](https://autohotkey.com/docs/KeyList.htm)，建議不要跟遊戲操作和打字會用到的按鍵重複，以免影響使用。
以下設定如果是你不需要用到的功能，可以直接跳過。

進階的AHK使用者，可以在`functions.ahk`中做更細緻的調整，也可以看情況增加自己喜歡的功能。



