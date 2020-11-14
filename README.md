# AHK-second-keyboard
AHK-second-keyboard is my AHK script for remapping my primary keyboard and for implementing a full second macro keyboard.

* [Installation](#installation)
    * [AutoHotKey](#autohotkey)
    * [AutoHotInterception](#autohotinterception)
        * [Including AHI](#including-ahi)
        * [Adding Your Keyboard](#adding-your-keyboard)
* [Customising](#customising)
    * [AHK-second-keyboard.ahk](#ahk-second-keyboardahk)
    * [GLOSSARY.ahk](#glossaryahk)
    * [KEYMAP.ahk](#keymapahk)
    * [REM_AST.ahk](#rem_astahk)
    * [VARIABLES.ahk](#variablesahk)


# Installation

## AutoHotKey
This script requres you to install [AutoHotKey](https://www.autohotkey.com/)

## AutoHotInterception
[AutoHotInterception](https://github.com/evilC/AutoHotInterception) is the layer that distinguishes between keyboards, if you use another method the script will have to be modified accordingly.
### Including AHI
You will have to modify .AHK/.ahk to `#include` AutoHotInterception as follows:
```c
#include %A_LineFile%\..\VARIABLES.ahk
#include %A_LineFile%\..\GLOSSARY.ahk
#include %A_LineFile%\..\KEYMAP.ahk
#include %A_LineFile%\..\REM_AST.ahk
#include DRIVE:\path\to\AHI\AutoHotInterception\Lib\AutoHotInterception.ahk
```
### Adding Your Keyboard
Use `AutoHotInterception/Monitor.ahk` or similar to find your keyboards HID and and add it to `AHK-second-keyboard.ahk:KBS`. As such my KBS looks like `[[0x1EA7,0x0907],[0x0461,0x0010]]` where `[0x1EA7,0x0907]` is my primary keyboard.


# Customising

## AHK-second-keyboard.ahk
If you want to add or change any of the macro keys it is reccommended you use the [KEYMAP](#keymapahk) rather than direct editing. To interact with the [KEYMAP](#keymapahk) use `AHK-second-keyboard.ahk:parseKey`.

## GLOSSARY.ahk
The GLOSSARY is organised in an n-dimensional array and recursively traversed by `AHK-second-keyboard.ahk:displayGloss`

## KEYMAP.ahk
```py
KEYMAP[(Str)"KEY"][(Int)STATE]
```
The `STATE` integer is built with the following [flags](https://stackoverflow.com/questions/34516693/how-to-work-with-integer-flags):

| MODIFIER       | STATE           | VALUE        | VALUE (hex)  |
| :------------- | :-------------- | :----------: | -----------: |
| DEFAULT        |                 | 0b0000_0000  | 0x00         |
| L_SHIFT        | CAPS            | 0b0000_0001  | 0x01         |
| R_SHIFT        | NEGATED         | 0b0000_0010  | 0x02         |
| L_ALT          | UPSIDE_DOWN     | 0b0000_0100  | 0x04         |
| R_ALT          | BLACKBOARD_BOLD | 0b0000_1000  | 0x08         |
| L_CTRL         | TO_GREEK        | 0b0001_0000  | 0x10         |
| R_CTRL         |                 | 0b0010_0000  | 0x20         |

## REM_AST.ahk
RA maps the scan code hotkeys to the corresponding letter

## VARIABLES.ahk
VARIABLES.ahk stores constant data