﻿;;
;    This file is part of LiquidZulu/AHK-second-keyboard.
;
;    AHK-second-keyboard is free software: you can redistribute it and/or modify
;    it under the terms of the GNU General Public License as published by
;    the Free Software Foundation, either version 3 of the License, or
;    (at your option) any later version.
;
;    AHK-second-keyboard is distributed in the hope that it will be useful,
;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;    GNU General Public License for more details.
;
;    You should have received a copy of the GNU General Public License
;    along with AHK-second-keyboard.  If not, see <https://www.gnu.org/licenses/>.
;;

#include %A_LineFile%\..\VARIABLES.ahk

;;; -- KEYMAP⊆VARIABLES -- ;;;

KEYMAP := {}

KEYMAP[SET_INTERSECTION] := {}
KEYMAP[SET_INTERSECTION][DEFAULT]         := SET_INTERSECTION
KEYMAP[SET_INTERSECTION][CAPS]            := SET_INTERSECTION
KEYMAP[SET_INTERSECTION][NEGATED]         := SET_INTERSECTION
KEYMAP[SET_INTERSECTION][UPSIDE_DOWN]     := SET_UNION
KEYMAP[SET_INTERSECTION][BLACKBOARD_BOLD] := SET_INTERSECTION
KEYMAP[SET_INTERSECTION][TO_GREEK]        := SET_INTERSECTION
KEYMAP[SET_INTERSECTION][R_CTRL]          := SET_INTERSECTION

KEYMAP[SUBSET[1]] := {}
KEYMAP[SUBSET[1]][DEFAULT]                  := SUBSET[1]
KEYMAP[SUBSET[1]][CAPS]                     := SUBSET[1]
KEYMAP[SUBSET[1]][NEGATED]                  := SUBSET[2]
KEYMAP[SUBSET[1]][UPSIDE_DOWN]              := SUPERSET[1]
KEYMAP[SUBSET[1]][UPSIDE_DOWN | NEGATED]    := SUPERSET[2]
KEYMAP[SUBSET[1]][BLACKBOARD_BOLD]          := SUBSET[1]
KEYMAP[SUBSET[1]][TO_GREEK]                 := SUBSET[1]
KEYMAP[SUBSET[1]][R_CTRL]                   := SUBSET[1]

KEYMAP[SET_MEMBERSHIP[1]] := {}
KEYMAP[SET_MEMBERSHIP[1]][DEFAULT]                  := SET_MEMBERSHIP[1]
KEYMAP[SET_MEMBERSHIP[1]][CAPS]                     := SET_MEMBERSHIP[1]
KEYMAP[SET_MEMBERSHIP[1]][NEGATED]                  := SET_MEMBERSHIP[2]
KEYMAP[SET_MEMBERSHIP[1]][UPSIDE_DOWN]              := SET_MEMBERSHIP[1]
KEYMAP[SET_MEMBERSHIP[1]][UPSIDE_DOWN | NEGATED]    := SET_MEMBERSHIP[2]
KEYMAP[SET_MEMBERSHIP[1]][BLACKBOARD_BOLD]          := SET_MEMBERSHIP[1]
KEYMAP[SET_MEMBERSHIP[1]][TO_GREEK]                 := SET_MEMBERSHIP[1]
KEYMAP[SET_MEMBERSHIP[1]][R_CTRL]                   := SET_MEMBERSHIP[1]

KEYMAP[CARTESIAN_PRODUCT] := {}
KEYMAP[CARTESIAN_PRODUCT][DEFAULT]         := CARTESIAN_PRODUCT
KEYMAP[CARTESIAN_PRODUCT][CAPS]            := SCALAR_PRODUCT
KEYMAP[CARTESIAN_PRODUCT][NEGATED]         := CARTESIAN_PRODUCT
KEYMAP[CARTESIAN_PRODUCT][UPSIDE_DOWN]     := CARTESIAN_PRODUCT
KEYMAP[CARTESIAN_PRODUCT][BLACKBOARD_BOLD] := CARTESIAN_PRODUCT
KEYMAP[CARTESIAN_PRODUCT][TO_GREEK]        := CARTESIAN_PRODUCT
KEYMAP[CARTESIAN_PRODUCT][R_CTRL]          := CARTESIAN_PRODUCT

KEYMAP[ALEPH[1]] := {}
KEYMAP[ALEPH[1]][DEFAULT]         := ALEPH[1]
KEYMAP[ALEPH[1]][CAPS]            := ALEPH[2]
KEYMAP[ALEPH[1]][NEGATED]         := ALEPH[1]
KEYMAP[ALEPH[1]][UPSIDE_DOWN]     := ALEPH[1]
KEYMAP[ALEPH[1]][BLACKBOARD_BOLD] := ALEPH[1]
KEYMAP[ALEPH[1]][TO_GREEK]        := ALEPH[1]
KEYMAP[ALEPH[1]][R_CTRL]          := ALEPH[1]

KEYMAP[EMPTY_SET] := {}
KEYMAP[EMPTY_SET][DEFAULT]         := EMPTY_SET
KEYMAP[EMPTY_SET][CAPS]            := EMPTY_SET
KEYMAP[EMPTY_SET][NEGATED]         := EMPTY_SET
KEYMAP[EMPTY_SET][UPSIDE_DOWN]     := EMPTY_SET
KEYMAP[EMPTY_SET][BLACKBOARD_BOLD] := EMPTY_SET
KEYMAP[EMPTY_SET][TO_GREEK]        := EMPTY_SET
KEYMAP[EMPTY_SET][R_CTRL]          := EMPTY_SET

KEYMAP[IMPLIES[1]] := {}
KEYMAP[IMPLIES[1]][DEFAULT]         := IMPLIES[1]
KEYMAP[IMPLIES[1]][CAPS]            := IMPLIES[1]
KEYMAP[IMPLIES[1]][NEGATED]         := IMPLIES[2]
KEYMAP[IMPLIES[1]][UPSIDE_DOWN]     := IMPLIES[1]
KEYMAP[IMPLIES[1]][BLACKBOARD_BOLD] := IMPLIES[1]
KEYMAP[IMPLIES[1]][TO_GREEK]        := IMPLIES[1]
KEYMAP[IMPLIES[1]][R_CTRL]          := IMPLIES[1]

KEYMAP[NEGATION] := {}
KEYMAP[NEGATION][DEFAULT]         := NEGATION
KEYMAP[NEGATION][CAPS]            := NEGATION
KEYMAP[NEGATION][NEGATED]         := NEGATION
KEYMAP[NEGATION][UPSIDE_DOWN]     := NEGATION
KEYMAP[NEGATION][BLACKBOARD_BOLD] := NEGATION
KEYMAP[NEGATION][TO_GREEK]        := NEGATION
KEYMAP[NEGATION][R_CTRL]          := NEGATION

KEYMAP[L_AND[1]] := {}
KEYMAP[L_AND[1]][DEFAULT]               := L_AND[1]
KEYMAP[L_AND[1]][CAPS]                  := L_AND[1]
KEYMAP[L_AND[1]][NEGATED]               := L_AND[2]
KEYMAP[L_AND[1]][UPSIDE_DOWN]           := L_OR[1]
KEYMAP[L_AND[1]][BLACKBOARD_BOLD]       := L_AND[1]
KEYMAP[L_AND[1]][TO_GREEK]              := L_AND[1]
KEYMAP[L_AND[1]][R_CTRL]                := L_AND[1]
KEYMAP[L_AND[1]][UPSIDE_DOWN | NEGATED] := L_OR[2]

KEYMAP[THEREFORE] := {}
KEYMAP[THEREFORE][DEFAULT]         := THEREFORE
KEYMAP[THEREFORE][CAPS]            := THEREFORE
KEYMAP[THEREFORE][NEGATED]         := THEREFORE
KEYMAP[THEREFORE][UPSIDE_DOWN]     := THEREFORE
KEYMAP[THEREFORE][BLACKBOARD_BOLD] := THEREFORE
KEYMAP[THEREFORE][TO_GREEK]        := THEREFORE
KEYMAP[THEREFORE][R_CTRL]          := THEREFORE

KEYMAP[PLUS_MINUS[1]] := {}
KEYMAP[PLUS_MINUS[1]][DEFAULT]         := PLUS_MINUS[1]
KEYMAP[PLUS_MINUS[1]][CAPS]            := PLUS_MINUS[1]
KEYMAP[PLUS_MINUS[1]][NEGATED]         := PLUS_MINUS[2]
KEYMAP[PLUS_MINUS[1]][UPSIDE_DOWN]     := PLUS_MINUS[2]
KEYMAP[PLUS_MINUS[1]][BLACKBOARD_BOLD] := PLUS_MINUS[1]
KEYMAP[PLUS_MINUS[1]][TO_GREEK]        := PLUS_MINUS[1]
KEYMAP[PLUS_MINUS[1]][R_CTRL]          := PLUS_MINUS[1]

KEYMAP[EQUALS[1]] := {}
KEYMAP[EQUALS[1]][DEFAULT]         := EQUALS[1]
KEYMAP[EQUALS[1]][CAPS]            := EQUALS[1]
KEYMAP[EQUALS[1]][NEGATED]         := EQUALS[2]
KEYMAP[EQUALS[1]][UPSIDE_DOWN]     := EQUALS[1]
KEYMAP[EQUALS[1]][BLACKBOARD_BOLD] := EQUALS[1]
KEYMAP[EQUALS[1]][TO_GREEK]        := EQUALS[1]
KEYMAP[EQUALS[1]][R_CTRL]          := EQUALS[1]


LETTER := 1
loop, 26{
    KEYMAP[alphabet[LETTER][2]] := {}
    KEYMAP[alphabet[LETTER][2]][DEFAULT]                            := alphabet[LETTER][1]
    KEYMAP[alphabet[LETTER][2]][CAPS]                               := alphabet[LETTER][2]
    KEYMAP[alphabet[LETTER][2]][NEGATED]                            := NEGATION alphabet[LETTER][1]
    KEYMAP[alphabet[LETTER][2]][NEGATED | CAPS]                     := NEGATION alphabet[LETTER][2]
    KEYMAP[alphabet[LETTER][2]][UPSIDE_DOWN]                        := UPDOWN_L[alphabet[LETTER][2]][1]
    KEYMAP[alphabet[LETTER][2]][UPSIDE_DOWN | CAPS]                 := UPDOWN_L[alphabet[LETTER][2]][2]
    KEYMAP[alphabet[LETTER][2]][NEGATED | UPSIDE_DOWN]              := NEGATION UPDOWN_L[alphabet[LETTER][2]][1]
    KEYMAP[alphabet[LETTER][2]][NEGATED | UPSIDE_DOWN | CAPS]       := NEGATION UPDOWN_L[alphabet[LETTER][2]][2] ; in case I get LShift + RShift to work
    KEYMAP[alphabet[LETTER][2]][BLACKBOARD_BOLD]                    := BB_L[alphabet[LETTER][2]][1]
    KEYMAP[alphabet[LETTER][2]][BLACKBOARD_BOLD | CAPS]             := BB_L[alphabet[LETTER][2]][2]
    KEYMAP[alphabet[LETTER][2]][NEGATED | BLACKBOARD_BOLD]          := NEGATION BB_L[alphabet[LETTER][2]][1]
    KEYMAP[alphabet[LETTER][2]][NEGATED | BLACKBOARD_BOLD | CAPS]   := NEGATION BB_L[alphabet[LETTER][2]][2]
    KEYMAP[alphabet[LETTER][2]][TO_GREEK]                           := GREEK_L[alphabet[LETTER][2]][1]
    KEYMAP[alphabet[LETTER][2]][TO_GREEK | CAPS]                    := GREEK_L[alphabet[LETTER][2]][2]
    KEYMAP[alphabet[LETTER][2]][NEGATED | TO_GREEK]                 := NEGATION GREEK_L[alphabet[LETTER][2]][1]
    KEYMAP[alphabet[LETTER][2]][NEGATED | TO_GREEK | CAPS]          := NEGATION GREEK_L[alphabet[LETTER][2]][2]
    KEYMAP[alphabet[LETTER][2]][R_CTRL]                             := alphabet[LETTER][1]
    LETTER++
}
KEYMAP["E"][NEGATED | UPSIDE_DOWN | CAPS] := "∄"


i := 0
loop, 10{
    KEYMAP[i] := {}
    KEYMAP[i][DEFAULT]                            := SUBSUPERSCRIPT[i][1]
    KEYMAP[i][CAPS]                               := SUBSUPERSCRIPT[i][2]
    KEYMAP[i][NEGATED]                            := NEGATION SUBSUPERSCRIPT[i][1]
    KEYMAP[i][NEGATED | CAPS]                     := NEGATION SUBSUPERSCRIPT[i][2]
    KEYMAP[i][UPSIDE_DOWN]                        := SUBSUPERSCRIPT[i][2]
    KEYMAP[i][UPSIDE_DOWN | CAPS]                 := SUBSUPERSCRIPT[i][1]
    KEYMAP[i][NEGATED | UPSIDE_DOWN]              := NEGATION SUBSUPERSCRIPT[i][2]
    KEYMAP[i][NEGATED | UPSIDE_DOWN | CAPS]       := NEGATION SUBSUPERSCRIPT[i][1]
    KEYMAP[i][BLACKBOARD_BOLD]                    := SUBSUPERSCRIPT[i][1]
    KEYMAP[i][BLACKBOARD_BOLD | CAPS]             := SUBSUPERSCRIPT[i][2]
    KEYMAP[i][NEGATED | BLACKBOARD_BOLD]          := NEGATION SUBSUPERSCRIPT[i][1]
    KEYMAP[i][NEGATED | BLACKBOARD_BOLD | CAPS]   := NEGATION SUBSUPERSCRIPT[i][2]
    KEYMAP[i][TO_GREEK]                           := SUBSUPERSCRIPT[i][1]
    KEYMAP[i][TO_GREEK | CAPS]                    := SUBSUPERSCRIPT[i][2]
    KEYMAP[i][NEGATED | TO_GREEK]                 := NEGATION SUBSUPERSCRIPT[i][1]
    KEYMAP[i][NEGATED | TO_GREEK | CAPS]          := NEGATION SUBSUPERSCRIPT[i][2]
    KEYMAP[i][R_CTRL]                             := SUBSUPERSCRIPT[i][1]
    i++
}