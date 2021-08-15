[中文版說明](https://github.com/heyfey/POE_Utility/blob/master/README.md)

## Overview

**POE-Utility** provides shortcuts for PoE such as: **quick-loot**, **quick-flasks**, **auto-flasks**, and **switch channel**, etc. These shorcuts can significantly improve one's gaming experience

Though I simply implement some features I need, any suggestion is welcome. Feel free to open issues or contact tsungtsohsieh@gmail.com

## *WARNING* 

*User must understand that many features of this script definitely violate PoE user rules.*

---

* [Demo](#Demo)
* [Usage](#Usage)
* [GUI](#GUI)
* [Settings](#Settings)

---

## Demo

Please click in the links to see demos and how to use.

### [Quick loot](https://i.imgur.com/2PIWJTh.gifv)

### [Auto-flasks when low life](https://i.imgur.com/8lDp650.gifv)

### [Quick-flasks](https://i.imgur.com/GDZHEh4.gifv)


## Usage

1. Clone or download this repository

2. Run `POE_Utility.exe` **as administrator**

~~1. Download and install [AutoHotKey](https://www.autohotkey.com/); If unexpectedly shutdown or hang, try version [`AutoHotkey_1.1.28.02`](https://www.autohotkey.com/download/1.1/)~~

~~2. Clone or download this repository~~

~~3. Run `POE_Utility.ahk` **as administrator**~~

## GUI

![image](https://user-images.githubusercontent.com/19587790/129465862-2ec27bde-d61f-4a6f-9a46-f80022d12830.png)

## Settings

### Quick-loot

[demo](https://i.imgur.com/2PIWJTh.gifv)

+ AHK will search for pixel with target **color** and click it; we use itemfilter to display color we want
+ In your itemfilter, add `SetBorderColor 100 0 122 255` to your desire loot
+ Or simply use the [itemfilter I provided](https://github.com/heyfey/POE_Utility/tree/master/itemfilter) (modified from [NeverSink-Filter](https://github.com/NeverSinkDev/NeverSink-Filter) ) to quick-loot: currency, 6-socket, map, fossil, resonator, incubator, valuable prophecy, divination card, high-tier essence, oil


### Quick-flasks

[demo](https://i.imgur.com/GDZHEh4.gifv) (Please click in the link to see how to use)

+ Different character may need different settings for quick-flasks and auto-flasks
+ You can change key binding and flasks list in GUI
+ `list` is the key sequence you want to send, which is not limited to flasks, you can add as many keys (skills) as you want; use `-` as delimiter 
+ For example: `2-3-4-5-q-w-e`, `2345` for utility flasks, `q` for Blood Rage, `w` for Steelskin/Molten Shell, `e` for Phase Run
+ In game, use `Ctrl + L` to turn on/off quick-flasks


### Auto-flasks 

[demo](https://i.imgur.com/8lDp650.gifv) (Please click in the link to see how to use)

1. Input flasks list, use `-` as delimiter

2. Point to blood line you want to auto-flasks, press `Ctrl + Shift + F` to comfirm

3. In game, use `Ctrl + F` to turn on/off auto-flasks


### Advanced settings

Advanced AHK users can further customize features in `functions.ahk`, contributions are also welcome


