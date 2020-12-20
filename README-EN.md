[中文版說明](https://github.com/heyfey/POE_Utility/blob/master/README.md)

**POE-Utility** is an [AutoHotkey](https://www.autohotkey.com/) script, which provides shortcuts for PoE such as: quick-flasks, quick-loot, auto-flasks, auto-detonate, and switch channel, etc. These shorcuts can significantly improve one's gaming experience

Though I simply implement some features I need, any suggestion is welcome. Feel free to open issues or contact tsungtsohsieh@gmail.com

---

### *WARNING* ###

*User must understand that many features of this script definitely violate PoE user rules.*

---

### shortcuts ###

|Shortcut|Description|
|---    |---    |
| `2`, `3`, `side button`      | quick flasks
| `A`      | quick loot
| `Ctrl + A`      | hold to keep auto-looting
| `Ctrl + P`      | use protal scroll 
| `Ctrl + D`      | auto-detonating mine on/off
| `Ctrl + F`      | auto-flasks on/off
| `F2 ~ F8`，`Ctrl + ~` | quick enter |
| `Ctrl + PageUp`      | search item on cursor; if none, search by input
| `Shift + D`      | get cursor [coordinate, color]

---

### usage ###

1. Clone or download this repository

2. Run `POE_Utility.exe` **as administrator**

~~1. Download and install [AutoHotKey](https://www.autohotkey.com/); If unexpectedly shutdown or hang, try version [`AutoHotkey_1.1.28.02`](https://www.autohotkey.com/download/1.1/)~~

~~2. Clone or download this repository~~

~~3. Run `POE_Utility.ahk` **as administrator**~~

---

### settings ###

#### preview ####

![](https://i.imgur.com/KKYFncG.png)

#### quick-flasks ####

+ Different character may need different settings of quick-flasks and auto-flasks
+ You can change key binding and flasks list in setting window
+ **list** is the key sequence you want to send, which is not limited to flasks, you can add as many keys (skills) as you want; use `-` as delimiter 
+ For example: `2-3-4-5-q-w-e`, `2345` for utility flasks, `q` for Blood Rage, `w` for Steelskin/Molten Shell, `e` for Phase Run

<blockquote class="imgur-embed-pub" lang="en" data-id="a/yp8D0kz"  ><a href="//imgur.com/a/yp8D0kz">quick flask demo</a></blockquote>

#### auto-flasks ####

1. Point to blood line you want to auto-flasks, use `Shift + D` to get cursor coordinate(X, Y) and color
2. Input coordinate(x, Y) and color in setting window
3. Input flasks list, use `-` as delimiter
4. In game, use `Ctrl + F` to turn on/off auto-flasks

<blockquote class="imgur-embed-pub" lang="en" data-id="a/a79rwEU"  ><a href="//imgur.com/a/a79rwEU">auto flask demo</a></blockquote>

#### quick-loot ####

+ AHK will search for pixel with target **"color"** and click it; we use itemfilter to display color we want
+ In your itemfilter, add `SetBorderColor 100 0 122 255` to your desire loot
+ Or simply use the itemfilter I provided (modified from [NeverSink-Filter](https://github.com/NeverSinkDev/NeverSink-Filter) ):
    + **NeverSink's filter - 2-SEMI-STRICT(forQuickLoot)**： currency except scrolls, 6-socket, map, fossil, valuable prophecy and divination card
    + **NeverSink's filter - 3-STRICT(forQuickLoot)**： currency worth 0.5C, 6-socket, map, fossil, valuable prophecy and divination card

<blockquote class="imgur-embed-pub" lang="en" data-id="a/ZtkeSUo"  ><a href="//imgur.com/a/ZtkeSUo">quick loot demo</a></blockquote>

#### use protal scroll ####

#### auto-detonate ####

#### advanced settings ####
All settings and key binding can be done by modify `POE_Utility.ahk`;
refer to [List of Keys](https://autohotkey.com/docs/KeyList.htm) for key binding. Note that you may not want to add keys for game play and typing to shortcut

Advanced AHK users can further customize features in `functions.ahk`, contributions are also welcome


