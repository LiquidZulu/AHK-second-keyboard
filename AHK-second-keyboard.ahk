﻿;;
;	 This program is free software: you can redistribute it and/or modify
;    it under the terms of the GNU General Public License as published by
;    the Free Software Foundation, either version 3 of the License, or
;    (at your option) any later version.
;
;    This program is distributed in the hope that it will be useful,
;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;    GNU General Public License for more details.
;
;    You should have received a copy of the GNU General Public License
;    along with this program.  If not, see <https://www.gnu.org/licenses/>.
;;


#SingleInstance force
#Persistent
#NoEnv
#MaxHotkeysPerInterval 2000
#include ./.AHK/.ahk

SetWorkingDir %A_ScriptDir%
SendMode Input

;; PREAMBLE END ;;

KID := 0
KCM := 1
KBS := [[0x1EA7,0x0907],[0x0461,0x0010]]
AHI := new AutoHotInterception()

K := []
K[1] := {}
K[2] := {}

K[1][KID] := AHI.GetKeyboardId(KBS[1][1],KBS[1][2],1)
K[1][KCM] := AHI.CreateContextManager(K[1][KID])

K[2][KID] := AHI.GetKeyboardId(KBS[2][1],KBS[2][2],1)
K[2][KCM] := AHI.CreateContextManager(K[2][KID])



;;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||;;
;;|||||||||||||||||||||||||||||| BEGIN KEYBOARD 1 |||||||||||||||||||||||||||||;;
;;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||;;

#if K[1][KCM].IsActive

	; Colemak Mod-DH wide mapping for ANSI boards

	; ;SC002::1
	; ;SC003::2
	; ;SC004::3
	; ;SC005::4
	; ;SC006::5
	; ;SC007::6
	; SC008::=
	; SC009::7
	; SC00a::8
	; SC00b::9
	; SC00c::0
	; SC00d::-

	; ;SC010::q
	; ;SC011::w
	; SC012::f
	; SC013::p
	; SC014::b
	; SC015::[
	; SC016::j
	; SC017::l
	; SC018::u
	; SC019::y
	; SC01A::;
	; SC01B::'

	; ;SC01E::a
	; SC01F::r
	; SC020::s
	; SC021::t
	; SC022::g
	; SC023::]
	; SC024::m
	; SC025::n
	; SC026::e
	; SC027::i
	; SC028::o

	; SC02b::\
	; SC02c::x
	; SC02d::c
	; SC02e::d
	; ;SC02f::v
	; SC030::z
	; SC031::/
	; SC032::k
	; SC033::h
	; SC034::,
	; SC035::.


	; set Backspace to CapsLock key

	; sc03a::backspace


	; YEIO arrow keys

	;>!SC015::send, {up}
	;>!SC012::send, {left}
	;>!SC017::send, {down}
	;>!SC018::send, {right}


	; esc tilde

	;>!SC001::`


#if


;;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||;;
;;|||||||||||||||||||||||||||||| BEGIN KEYBOARD 2 |||||||||||||||||||||||||||||;;
;;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||;;

#if K[2][KCM].IsActive

	;;------------------------  ALPHABET  --------------------------;;

	*SC010::
	*SC011::
	*SC012::
	*SC013::
	*SC014::
	*SC015::
	*SC016::
	*SC017::
	*SC018::
	*SC019::
	*SC01E::
	*SC01F::
	*SC020::
	*SC021::
	*SC022::
	*SC023::
	*SC024::
	*SC025::
	*SC026::
	*SC02c::
	*SC02d::
	*SC02e::
	*SC02f::
	*SC030::
	*SC031::
	*SC032::parseKey(RA[A_ThisHotkey])


	;;------------------------  FUNCTION  --------------------------;;

	*F1::parseKey(SET_INTERSECTION)
	*F2::parseKey(SUBSET[1])
	*F3::parseKey(CARTESIAN_PRODUCT)
	*F4::parseKey(ALEPH[1])
	*F5::parseKey(EMPTY_SET)
	*F6::parseKey(IMPLIES[1])
	*F7::parseKey(NEGATION)
	*F9::parseKey(L_AND[1])
	*F8::parseKey(THEREFORE)
	*F10::parseKey(PLUS_MINUS[1])
	*F11::parseKey(SET_MEMBERSHIP[1])
	*F12::parseKey("B")


	;;------------------------  MISC  --------------------------;;

	*SC029::`
	*SC002::parseKey(1)
	*SC003::parseKey(2)
	*SC004::parseKey(3)
	*SC005::parseKey(4)
	*SC006::parseKey(5)
	*SC007::parseKey(6)
	*SC008::parseKey(7)
	*SC009::parseKey(8)
	*SC00a::parseKey(9)
	*SC00b::parseKey(0)
	*SC00c::
	*SC00d::parseKey(EQUALS[1])
	*backspace::backspace

	*tab::

	*[::
	*]::
	*\::
	capslock::

	*enter::

	*,::
	*.::
	*/::MsgBox, L_SHIFT`t<---> CAPS`nR_SHIFT`t<---> NEGATED`nL_ALT`t<---> UPSIDE_DOWN`nR_ALT`t<---> BLACKBOARD_BOLD`nL_CTRL`t<---> TO_GREEK`n

	*space::
		tooltip,
		send, {U+0x200B}
	return


	;;===================== MODIFIERS =========================;;

	LShift::IS__L_SHIFT := 1 ;ToolTip % "CAPS: " IS__L_SHIFT "`nNEGATED: " IS__R_SHIFT "`nUPSIDE_DOWN: " IS__L_ALT "`nBLACKBOARD_BOLD: " IS__R_ALT "`nTO_GREEK: " IS__L_CTRL return
	Lctrl::IS__L_CTRL   := 1
	Lwin::IS__L_WIN     := 1
	Lalt::IS__L_ALT     := 1

	RAlt::IS__R_ALT     := 1
	Rwin::IS__R_WIN     := 1
	Rctrl::IS__R_CTRL   := 1
	RShift::IS__R_SHIFT := 1

	LShift Up::IS__L_SHIFT := 0
	Lctrl Up::IS__L_CTRL   := 0
	Lwin Up::IS__L_WIN     := 0
	Lalt Up::IS__L_ALT     := 0

	RAlt Up::IS__R_ALT     := 0
	Rwin Up::IS__R_WIN     := 0
	Rctrl Up::IS__R_CTRL   := 0
	RShift Up::IS__R_SHIFT := 0


	;;================= LOCKING KEYS ======================;;

	ScrollLock::^+!Q

	;;================= NEXT SECTION ======================;;

	PrintScreen::PrintScreen

	insert::displayGloss([GLOSSARY], 1)

	delete::

	home::
	end::

	pgup::
	pgdn::

	;;================= NEXT SECTION ======================;;

	up::up
	down::down
	left::left
	right::right

	+up::Send, {U+2191}
	+down::Send, {U+2193}
	+left::Send, {U+2190}
	+right::Send, {U+2192}

	;;================== THE NUMPAD ======================;;

	numpad0::
	numpad1::Run, D:\OBS\obs-studio\bin\32bit\obs32.exe
	numpad2::
	numpad3::
	numpad4::Run, D:\Blender\Blender.exe
	numpad5::Run, D:\WinDirStat\windirstat.exe
	numpad6::Run, D:\FL Studio\FL64.exe
	numpad7::Run, D:\GIMP 2\bin\gimp-2.10.exe
	numpad8::Run, D:\!!!_BUDGET\2020-07\budget.xlsx
	numpad9::Run, D:\Git\Git\git-bash.exe, D:\Git\Git


	;;NumLock::tooltip, DO NOT USE THIS IN YOUR 2ND KEYBOARD!
	numpadDiv::
	numpadMult::
	numpadSub::
	numpadAdd::
	numpadEnter::
	numpadDot::
#if


parseKey(k:="A"){

	global DEFAULT

	global L_SHIFT
	global IS__L_SHIFT
	
	global R_SHIFT
	global IS__R_SHIFT
	
	global L_ALT
	global IS__L_ALT
	
	global R_ALT
	global IS__R_ALT
	
	global L_CTRL
	global IS__L_CTRL
	
	global R_CTRL
	global IS__R_CTRL

	global KEYMAP
	global CLIPBOARDS

	global KEY_TYPE    
	global KEY_SIBLING 
	global KEY_REL_CLIP

	if not IS__R_CTRL{
		SendRaw % KEYMAP[k][DEFAULT|(L_SHIFT*IS__L_SHIFT)|(R_SHIFT*IS__R_SHIFT)|(L_ALT*IS__L_ALT)|(R_ALT*IS__R_ALT)|(L_CTRL*IS__L_CTRL)]
	}
	else{
		CLIPBOARD_MANAGER(k,CLIPBOARDS["MAP"][k][KEY_TYPE])
	}
	;ToolTip % DEFAULT|(L_SHIFT*IS__L_SHIFT)|(R_SHIFT*IS__R_SHIFT)|(L_ALT*IS__L_ALT)|(R_ALT*IS__R_ALT)|(L_CTRL*IS__L_CTRL)|(R_CTRL*IS__R_CTRL)
}

displayGloss(Gs, l){

	choices := "Insert a number corresponding to glossary entry`n`n`n[0] GO BACK`n"
	i       := 1
	j       := []

	for KEY, CONTENT in Gs[l]{
		choices .= "[" i "] " "[" KEY "] " CONTENT "`n"
		j[i]    := KEY
		i++
	}

	if (i > 1){

		InputBox, selection, Glossary Search, %choices%,, %A_ScreenWidth%, %A_ScreenHeight%
		

		if (selection > 0){
			Gs.push(Gs[l][j[selection]])
			displayGloss(Gs, l+1)
		}

		else if (selection == 0){
			Gs.RemoveAt(l)
			displayGloss(Gs, l-1)
		}
	}
	else{
		clipboard := Gs[l]
		ToolTip % "Text copied to clipboard"
		Sleep, 1000
		ToolTip
	}
}


; MIDI


; #include %A_LineFile%\..\.AHK\.lib\AHK_Generic-Midi-Program\Generic_midi_App_ 07.ahk
; 
; MIDI_in(d, _cb){
; 
; 	DeviceID        := d          ; midiindevice from IniRead above assigned to deviceid
; 	CALLBACK_WINDOW := 0x10000    ; from orbiks code for midi input
; 
; 	hWnd := WinExist() 
; 
; 	hMidiIn =
; 	VarSetCapacity(hMidiIn, 4, 0)
; 	result := DllCall("winmm.dll\midiInOpen", UInt,&hMidiIn, UInt,DeviceID, UInt,hWnd, UInt,0, UInt,CALLBACK_WINDOW, "UInt")
; 		If result
; 		{
; 			MsgBox, Error, midiInOpen Returned %result%`n
; 			;GoSub, sub_exit
; 		}
; 
; 	hMidiIn := NumGet(hMidiIn)              ; because midiInOpen writes the value in 32 bit binary Number, AHK stores it as a string
; 	result := DllCall("winmm.dll\midiInStart", UInt,hMidiIn)
; 		If result
; 		{
; 			MsgBox, Error, midiInStart Returned %result%`nRight Click on the Tray Icon - Left click on MidiSet to select valid midi_in port.
; 			;GoSub, sub_exit
; 		}
; 
; 	OpenCloseMidiAPI()
; 		; ----- the OnMessage listeners ----
; 		; LEFT HERE FOR REFERENCE
; 		; #define MM_MIM_OPEN 0x3C1 /* MIDI input */
; 		; #define MM_MIM_CLOSE 0x3C2
; 		; #define MM_MIM_DATA 0x3C3
; 		; #define MM_MIM_LONGDATA 0x3C4
; 		; #define MM_MIM_ERROR 0x3C5
; 		; #define MM_MIM_LONGERROR 0x3C6
; 
; 		OnMessage(0x3C1, _cb)  ;  See top of this file for function called when a midi message is detected
; 		OnMessage(0x3C2, _cb)  
; 		OnMessage(0x3C3, _cb)
; 		OnMessage(0x3C4, _cb)
; 		OnMessage(0x3C5, _cb)
; 		OnMessage(0x3C6, _cb)
; 
; 	Return
; }
; 
; MIDI_handler(hInput, midiMsg, wMsg){
; 
; 	statusbyte    :=  midiMsg & 0xFF                ; Extract statusbyte = what type of midi message and what midi channel
;     chan          := (statusbyte & 0x0f) + 1        ; WHAT MIDI CHANNEL IS THE MESSAGE ON? EXTRACT FROM STATUSBYTE
;     data1         := (midiMsg >> 8) & 0xFF          ; THIS IS DATA1 VALUE = NOTE NUMBER OR CC NUMBER
;     data2         := (midiMsg >> 16) & 0xFF         ; DATA2 VALUE IS NOTE VELEOCITY OR CC VALUE
;     pitchb        := (data2 << 7) | data1           ;(midiMsg >> 8) & 0x7F7F  masking to extract the pbs  
; 
; 	if statusbyte between 176 and 191   ; Is message a CC
; 		stb := "CC"                     	; if so then set stb to CC - only used with the midi monitor
; 
; 	if statusbyte between 144 and 159   ; Is message a Note On
; 		stb := "NoteOn"                 	; Set gui var
; 
; 	if statusbyte between 128 and 143   ; Is message a Note Off?
; 		stb := "NoteOff"                	; set gui to NoteOff
; 
; 	if statusbyte between 192 and 208   ;Program Change
; 		stb := "PC"
; 
; 	if statusbyte between 224 and 239   ; Is message a Pitch Bend
; 		stb := "PitchB"                 	; Set gui to pb
; 
; 	MsgBox % "Channel: " chan "`nNote: " data1 "`nVelocity: " data2
; }

;MIDI_in(1,"MIDI_handler")