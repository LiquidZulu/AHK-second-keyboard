;;
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

;;; -- VARIABLES -- ;;;

alphabet := [["a","A"],["b","B"],["c","C"],["d","D"],["e","E"],["f","F"],["g","G"],["h","H"],["i","I"],["j","J"],["k","K"],["l","L"],["m","M"],["n","N"],["o","O"],["p","P"],["q","Q"],["r","R"],["s","S"],["t","T"],["u","U"],["v","V"],["w","W"],["x","X"],["y","Y"],["z","Z"]]

DEFAULT := 0
L_SHIFT := 1
R_SHIFT := 2
L_ALT   := 4
R_ALT   := 8
L_CTRL  := 16
R_CTRL  := 32

CAPS            := L_SHIFT
NEGATED         := R_SHIFT
UPSIDE_DOWN     := L_ALT
BLACKBOARD_BOLD := R_ALT
TO_GREEK        := L_CTRL

IS__L_SHIFT := 0
IS__L_CTRL  := 0
IS__L_WIN   := 0
IS__L_ALT   := 0

IS__R_ALT   := 0
IS__R_WIN   := 0
IS__R_CTRL  := 0
IS__R_SHIFT := 0

; Binary operators
CARTESIAN_PRODUCT := "×"
SCALAR_PRODUCT    := "ꞏ"
PLUS_MINUS        := ["±", "∓"]

; SETS
SET_INTERSECTION := "⋂"
SET_UNION        := "⋃"
SUBSET           := ["⊆", "⊄"]
STRICT_SUBSET    := ["⊂", "⊄"]
SUPERSET         := ["⊇", "⊅"]
STRICT_SUPERSET  := ["⊃", "⊅"]
SET_MEMBERSHIP   := ["∈", "∉"]
ALEPH            := ["א", "ℵ"]
EMPTY_SET        := "Ø"

; Logic
IMPLIES    := ["⇒", "⇏"]
IFF        := "⇔"
NEGATION   := "¬"
L_AND      := ["∧", "⊼"]
L_OR       := ["∨", "⊽"]
L_XOR      := "⊻"
UP_ARROW   := "↑"
DOWN_ARROW := "↓"
THEREFORE  := "∴"
BECAUSE    := "∵"
MODELS     := "⊧"
L_TRUE     := "⊨"
PROVES     := ["⊢", "⊬"]
EQUALS     := ["=", "≠"]
APPPOX     := "≈"

; BB BOLD
BB_L := {}
BB_L["A"]     := ["𝕒", "𝔸"]
BB_L["B"]     := ["𝕓", "𝔹"]
BB_L["C"]     := ["𝕔", "ℂ"]
BB_L["D"]     := ["𝕕", "𝔻"]
BB_L["E"]     := ["𝕖", "𝔼"]
BB_L["F"]     := ["𝕗", "𝔽"]
BB_L["G"]     := ["𝕘", "𝔾"]
BB_L["H"]     := ["𝕙", "ℍ"]
BB_L["I"]     := ["𝕚", "𝕀"]
BB_L["J"]     := ["𝕛", "𝕁"]
BB_L["K"]     := ["𝕜", "𝕂"]
BB_L["L"]     := ["𝕝", "𝕃"]
BB_L["M"]     := ["𝕞", "𝕄"]
BB_L["N"]     := ["𝕟", "ℕ"]
BB_L["O"]     := ["𝕠", "𝕆"]
BB_L["P"]     := ["𝕡", "ℙ"]
BB_L["Q"]     := ["𝕢", "ℚ"]
BB_L["R"]     := ["𝕣", "ℝ"]
BB_L["S"]     := ["𝕤", "𝕊"]
BB_L["T"]     := ["𝕥", "𝕋"]
BB_L["U"]     := ["𝕦", "𝕌"]
BB_L["V"]     := ["𝕧", "𝕍"]
BB_L["W"]     := ["𝕨", "𝕎"]
BB_L["X"]     := ["𝕩", "𝕏"]
BB_L["Y"]     := ["𝕪", "𝕐"]
BB_L["Z"]     := ["𝕫", "ℤ"]
BB_L["GAMMA"] := ["ℽ", "ℾ"]
BB_L["PI"]    := ["ℼ", "ℿ"]
BB_L["SIGMA"] := ["⅀", "⅀"]

; Greek
GREEK_L := {}
GREEK_L["A"] := ["α", "Α"]
GREEK_L["B"] := ["β", "Β"]
GREEK_L["C"] := ["χ", "Χ"]
GREEK_L["D"] := ["δ", "Δ"]
GREEK_L["E"] := ["ε", "Ε"]
GREEK_L["F"] := ["f", "F"] ; regular
GREEK_L["G"] := ["γ", "Γ"]
GREEK_L["H"] := ["η", "Η"]
GREEK_L["I"] := ["ι", "Ι"]
GREEK_L["J"] := ["f", "F"] ; regular
GREEK_L["K"] := ["κ", "Κ"]
GREEK_L["L"] := ["λ", "Λ"]
GREEK_L["M"] := ["μ", "Μ"]
GREEK_L["N"] := ["ν", "Ν"]
GREEK_L["O"] := ["ο", "Ο"]
GREEK_L["P"] := ["π", "Π"]
GREEK_L["Q"] := ["τ", "Τ"]
GREEK_L["R"] := ["ρ", "Ρ"]
GREEK_L["S"] := ["Σ", "σ"]
GREEK_L["T"] := ["θ", "Θ"]
GREEK_L["U"] := ["υ", "v"]
GREEK_L["V"] := ["φ", "Φ"]
GREEK_L["W"] := ["ω", "Ω"]
GREEK_L["X"] := ["ξ", "Ξ"]
GREEK_L["Y"] := ["ψ", "Ψ"]
GREEK_L["Z"] := ["ζ", "Ζ"]

; Upside down
UPDOWN_L := {}
UPDOWN_L["A"]     := ["ɐ", "∀"]
UPDOWN_L["B"]     := ["q", "ꓭ"]
UPDOWN_L["C"]     := ["ɔ", "Ͻ"]
UPDOWN_L["D"]     := ["p", "ᗡ"]
UPDOWN_L["E"]     := ["ǝ", "∃"]
UPDOWN_L["F"]     := ["ⅎ", "ᖵ"]
UPDOWN_L["G"]     := ["ƃ", "⅁"]
UPDOWN_L["H"]     := ["ɥ", "H"]
UPDOWN_L["I"]     := ["ᴉ", "I"]
UPDOWN_L["J"]     := ["ɾ", "ᒋ"]
UPDOWN_L["K"]     := ["ʞ", "ꓘ"]
UPDOWN_L["L"]     := ["ʅ", "⅂"]
UPDOWN_L["M"]     := ["ɯ", "ꟽ"]
UPDOWN_L["N"]     := ["u", "N"]
UPDOWN_L["O"]     := ["o", "O"]
UPDOWN_L["P"]     := ["d", "Ԁ"]
UPDOWN_L["Q"]     := ["b", "Ꝺ"]
UPDOWN_L["R"]     := ["ɹ", "ꓤ"]
UPDOWN_L["S"]     := ["s", "S"]
UPDOWN_L["T"]     := ["ʇ", "ꓕ"]
UPDOWN_L["U"]     := ["n", "Ո"]
UPDOWN_L["V"]     := ["ʌ", "Ʌ"]
UPDOWN_L["W"]     := ["ʍ", "Ϻ"]
UPDOWN_L["X"]     := ["x", "X"]
UPDOWN_L["Y"]     := ["ʎ", "⅄"]
UPDOWN_L["Z"]     := ["z", "Z"]