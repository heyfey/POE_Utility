
[English guide](https://github.com/heyfey/POE_Utility/blob/master/README-EN.md)



**POE-Utility**
是一份AHK腳本，提供POE的快捷鍵包括：**自動撿裝、自動喝水、一鍵喝水、切換頻道**，等等

並且根據實際需求，持續擴充當中



## 免責聲明 

此腳本的許多功能**絕對違反**遊戲規章，使用此程式者請自行承擔所有可能後果和風險>>>[可以參考這裡](https://www.ptt.cc/bbs/PathofExile/M.1536799446.A.BB1.html)

> (不過我還沒被封就是了) (本腳本不會讀取/修改記憶體內容)

---

* [Demo](#Demo)
* [如何使用](#如何使用)
* [介面](#介面)
* [設定](#設定)

---

## Demo 

(請點進去看展示，以及如何設定)

### [自動撿裝](https://i.imgur.com/2PIWJTh.gifv)

### [偵測血線(或魔力)自動喝水](https://i.imgur.com/8lDp650.gifv)

### [一鍵喝水](https://i.imgur.com/GDZHEh4.gifv)

## 如何使用

1. `Clone or download`下載本專案所有原始碼

2. 以系統管理員身分執行 `POE_Utility.exe`

~~1. 下載並安裝[AutoHotKey](https://www.autohotkey.com/)。如果會閃退或沒反應，試試看版本號 `AutoHotkey_1.1.28.02`~~

~~2. `Clone or download`下載本專案所有原始碼~~

~~3. 以系統管理員身分執行 `POE_Utility.ahk`~~


## 介面 
![image](https://user-images.githubusercontent.com/19587790/129465762-8cf7d7af-2873-4094-98e4-a5e05a58861d.png)


## 設定

###  自動撿裝 quick loot

[demo](https://i.imgur.com/2PIWJTh.gifv)

+ 原理：AHK會在畫面中搜尋並點選指**顏色**的pixel，搭配過濾器來顯示指定的顏色

+ 打開你的過濾器，在想要撿取的物品加上`SetBorderColor 100 0 122 255`就行了

+ 也可以直接使用[我們提供的過濾器](https://github.com/heyfey/POE_Utility/tree/master/itemfilter)(修改自[NeverSink](https://github.com/NeverSinkDev/NeverSink-Filter))，自動撿取：通貨、六洞裝、地圖、預言、化石、鑄新儀、有價命運卡、培育器、高T精隨、油瓶


### 一鍵喝水 quick flask

[demo](https://i.imgur.com/GDZHEh4.gifv) (請點進去看如何設定)

+ 一鍵喝水和自動喝水兩個功能，在不同的角色配置應該要有不同的設定。

+ `list`是想要快速發送的按鍵序列，用`-`做分隔

+ 按鍵可以是藥水也可以是技能。比如`2-3-4-5-q-w-e`：`2345`是功能藥水，`q`是鋼筋鐵骨，`w`是鮮血狂怒，`e`是暗影迷蹤。建議在此功能中只使用**瞬發**的技能，不然可能有點蠢。

+ 在遊戲裡`Ctrl + L`開啟/關閉一鍵喝水


### 自動喝水 auto flask

[demo](https://i.imgur.com/8lDp650.gifv) (請點進去看如何設定)

1.  在`list`設定自動使用的藥水和技能

2. 滑鼠指著想要自動喝水的血線，`Ctrl + Shift + F`確認；建議指著血條時盡量靠右，避免礦坑的特效影響到系統判斷

3. 在遊戲裡`Ctrl + F`開啟/關閉自動喝水


### 進階設定 

進階的AHK使用者，可以在`functions.ahk`中做更細節的調整，也可以看情況增加自己喜歡的功能。


