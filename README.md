
***POE-Utility***
是一份AHK腳本，提供了一系列POE的快捷鍵包括：一鍵嗑藥、快速撿裝、自動喝水/引爆地雷、切換頻道，等等。
並且根據實際需求，持續擴充當中。

此腳本包含許多高度客製化的功能，故需先進行設定後才能順利運作。下方將提供詳盡的教學。

---
#### 警告 ####

請注意，此腳本的許多功能**絕對違反**了遊戲規章。請自行斟酌使用，作者將不負任何責任>>>[可以參考這裡](https://www.ptt.cc/bbs/PathofExile/M.1536799446.A.BB1.html)

---

#### 使用說明 ####

1. 下載並安裝 [AutoHotKey](https://www.autohotkey.com/)。 如果不能順利運行，可以試試 `AutoHotkey_1.1.28.02` 版本。

2. `Clone or download`下載本專案所有原始碼。

3. 以系統管理員身分執行 **POE_Utility.ahk**

---

#### 快捷鍵列表 ####

|Shortcut|Description|
|---    |---    |
| `滑鼠側鍵`      | 一鍵嗑藥 
| `A`      | 快速撿裝
| `Ctrl + A`      | "按住"持續撿取物品
| `Ctrl + F`      | 使用傳送卷軸 
| `Ctrl + D`      | 開啟/關閉自動引爆地雷
| `F7`      | 開啟/關閉自動喝水
| `Ctrl + PageUp`      | 在賣場查詢指到的物品，如果沒指到任何物品則用"輸入"查詢

|Shortcut|Description|
|---    |---    |
| `F2`      | 世界2
| `F3`      | 交易820
| `F4`      | 交易821
| `F5`      | 進入藏身處
| `F6`      | 世界820
| `Ctrl + ~`      | 回到角色選擇畫面

|Shortcut|Description|
|---    |---    |
| `Shift + D`      | 取得滑鼠座標, 顏色

---

#### 設定 ####
好麻煩，先自己看註解

##### 首先 #####

##### 一鍵嗑藥 #####

##### 撿裝 #####

>**原理：在畫面中搜索並點選指定的"顏色"，搭配過濾器使用。**

1. 在物品後加上`SetBorderColor 100 0 122 255`就可成為快速撿裝的對象。

2. 玩家也可直接使用本專案提供的兩種過濾器(修改自NeverSink)，快速撿裝包含：

   + **NeverSink's filter - 2-SEMI-STRICT(forQuickLoot)**： 卷軸以外的通貨、六洞裝、地圖

   + **NeverSink's filter - 3-STRICT(forQuickLoot)**： 價值**0.5C**以上的通貨、六洞裝、地圖

##### 使用傳送捲 #####

##### 自動引爆地雷 #####

##### 自動喝水 #####

---

#### 影片 ####

<a href="https://www.youtube.com/watch?v=-sM8SynMM5I" target="_blank"></a>
