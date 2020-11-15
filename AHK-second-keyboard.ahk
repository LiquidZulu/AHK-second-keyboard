;;
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

	;SC002::1
	;SC003::2
	;SC004::3
	;SC005::4
	;SC006::5
	;SC007::6
	SC008::=
	SC009::7
	SC00a::8
	SC00b::9
	SC00c::0
	SC00d::-

	;SC010::q
	;SC011::w
	SC012::f
	SC013::p
	SC014::b
	SC015::[
	SC016::j
	SC017::l
	SC018::u
	SC019::y
	SC01A::;
	SC01B::'

	;SC01E::a
	SC01F::r
	SC020::s
	SC021::t
	SC022::g
	SC023::]
	SC024::m
	SC025::n
	SC026::e
	SC027::i
	SC028::o

	SC02b::\
	SC02c::x
	SC02d::c
	SC02e::d
	;SC02f::v
	SC030::z
	SC031::/
	SC032::k
	SC033::h
	SC034::,
	SC035::.


	; set Backspace to CapsLock key

	; sc03a::backspace


	; YEIO arrow keys

	>!SC019::send, {up}
	>!SC026::send, {left}
	>!SC027::send, {down}
	>!SC028::send, {right}


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

	*tab::tooltip, [F23]  %A_thisHotKey%

	*[::
	*]::
	*\::tooltip, [F23]  %A_thisHotKey%
	capslock::tooltip, [F23] capslock

	*enter::tooltip, [F23]  %A_thisHotKey%

	*,::
	*.::tooltip, [F23]  %A_thishotKey%
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

	delete::tooltip, [F23] %A_thishotKey%

	home::
	end::tooltip, [F23] %A_thishotKey%

	pgup::
	pgdn::tooltip, [F23] %A_thishotKey%

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
	numpad1::
	numpad2::
	numpad3::
	numpad4::
	numpad5::
	numpad6::
	numpad7::Run, D:\GIMP 2\bin\gimp-2.10.exe
	numpad8::Run, D:\!!!_BUDGET\2020-07\budget.xlsx
	numpad9::tooltip,[F23] %A_thishotKey%


	;;NumLock::tooltip, DO NOT USE THIS IN YOUR 2ND KEYBOARD!
	numpadDiv::
	numpadMult::
	numpadSub::
	numpadAdd::
	numpadEnter::
	numpadDot::tooltip, [F23] %A_thishotKey%

#if


parseKey(k){

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

	SendRaw % KEYMAP[k][DEFAULT|(L_SHIFT*IS__L_SHIFT)|(R_SHIFT*IS__R_SHIFT)|(L_ALT*IS__L_ALT)|(R_ALT*IS__R_ALT)|(L_CTRL*IS__L_CTRL)|(R_CTRL*IS__R_CTRL)]
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