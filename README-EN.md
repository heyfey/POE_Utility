[中文版說明](https://github.com/heyfey/POE_Utility/blob/master/README.md)

**POE-Utility** is an [AutoHotkey](https://www.autohotkey.com/) Script, which provides shortcuts for PoE such as: quick-flasks, quick-loot, auto-flasks, auto-detonate, and switch channel, etc. These shorcuts can significantly improve one's gaming experience

Since most features provided by this script are highly customized, some preliminary settings are required. Please refer to [settings](#settings)

Usually I only implement a feature when I need it, yet any suggestion is  welcome. Feel free to open issues or contact tsungtsohsieh@gmail.com

---

### *WARNING* ###

*User must understand that many features of this script definitely violate PoE user rules.*

---

#### shortcuts ####

|Shortcut|Description|
|---    |---    |
| `side button`      | quick flasks
| `A`      | quick loot
| `Ctrl + A`      | hold to keep auto-looting
| `Ctrl + F`      | use protal scroll 
| `Ctrl + D`      | auto-detonating mine on/off
| `F7`      | auto-flasks on/off
| `Ctrl + PageUp`      | search item on cursor; if none, search by input

#### switch channel ####

|Shortcut|Description|
|---    |---    |
| `F2`      | /world 2
| `F3`      | /trade 820
| `F4`      | /trade 821
| `F5`      | /hideout
| `F6`      | /world 820
| `Ctrl + ~`      | character selection

#### misc ####

|Shortcut|Description|
|---    |---    |
| `Shift + D`      | get [coordinate, color] on cursor

---

### usage ###

1. Download and install [AutoHotKey](https://www.autohotkey.com/); If unexpectedly shutdown or hang, try version [`AutoHotkey_1.1.28.02`](https://www.autohotkey.com/download/1.1/)
2. Clone or download this repository

3. Complete preliminary [settings](#settings).

4. Run `POE_Utility.ahk` **as administrator**

---

### settings ###

All settings and key binding can be done by modify `POE_Utility.ahk`;
refer to [List of Keys](https://autohotkey.com/docs/KeyList.htm) for key binding. Note that you may not want to add keys for game play and typing to shortcut

Advanced AHK users can further customize features in `functions.ahk`, contributions are also welcome

#### quick-flasks ####

+ Different character may need different settings of quick-flasks and auto-flasks
+ Open `POE_Utility.ahk` with any text editor, find `quick_flask_list = "2-3-4-5-q-r"`, change content in `""` to key sequence, use `-` to separate
+ The sequence is not limited to flasks, you can add as many keys (skills) as you want 
+ For example: `"2-3-4-5-q-w-e"`; `2345` for utility flasks, `q` for Blood Rage, `w` for Steelskin/Molten Shell, `e` for Phase Run

#### quick-loot ####

+ AHK will search for pixel with target "color" and click it; we use itemfilter to display color we want
+ In your itemfilter, add `SetBorderColor 100 0 122 255` to your desire loot
+ Or simply use the itemfilter I provided (modified from [NeverSink-Filter](https://github.com/NeverSinkDev/NeverSink-Filter) ):
    + **NeverSink's filter - 2-SEMI-STRICT(forQuickLoot)**： currency except scrolls, 6-socket, map, fossil, valuable prophecy and divination card
    + **NeverSink's filter - 3-STRICT(forQuickLoot)**： currency worth 0.5C, 6-socket, map, fossil, valuable prophecy and divination card

#### auto-flasks ####

#### use protal scroll ####

#### auto-detonate ####

---

### vedio ###

