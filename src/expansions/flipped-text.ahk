﻿; flipped-text.ahk v0.1.0
; Copyright (c) 2023 Archie Adams
; TODO: GitHub URL
;
; MIT License
;
; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:
;
; The above copyright notice and this permission notice shall be included in all
; copies or substantial portions of the Software.
;
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
; SOFTWARE.
;

;! ========================================================================== !;
;! -------------------------------------------------------------------------- !;
;!!!!!!!!!!!! IMPORTANT! THIS FILE MUST BE ENCODED WITH UTF8+BOM !!!!!!!!!!!!!!;
;! -------------------------------------------------------------------------- !;
;! ========================================================================== !;

#NoEnv
SetBatchLines, -1

; Extended from original mappings found at:
; https://www.fileformat.info/convert/text/upside-down-map.htm
; https://www.web2generators.com/text-related-tools/write-upside-down

; flip_selected_text_hotkey := "#!Space"
toggle_flipped_text_hotkey := "!+Space"
global toggle_flipped_text := false

Hotkey, %toggle_flipped_text_hotkey%, toggleFlippedTextToggle
return

toggleFlippedTextToggle() {
  toggle_flipped_text := !toggle_flipped_text
}

; Hotkey, %flip_selected_text_hotkey%, flipSelectedText
; return

flipSelectedText() {
  ; TODO: use clipboard method
  ; TODO: Replace all 
  ; Good example perhps
  ; https://www.autohotkey.com/board/topic/24431-convert-text-uppercase-lowercase-capitalized-or-inverted/
}

#If (toggle_flipped_text)

; Non-standard characters
; :*:‿::Send ⁀{Left} ; - CHARACTER TIE (U+2040)
; :*:⁅::Send ⁆{Left} ; - RIGHT SQUARE BRACKET WITH QUILL (U+2046)
; :*:∴::Send ∵{Left} ; - BECAUSE (U+2235)

; Typing keys
Space::Send {Space}{Left}
Enter::Send {End}{Enter}
Tab::Send {Tab}{Left}
; Left::Send {Right}
; Right::Send {Left}
; End::Send {Home}
; Home::Send {End}
Delete::Send {Backspace}
Backspace::Send {Delete}

; Punctuation
; TODO: Rest of standard keyboaard punctuation
!::Send ¡{Left} ; - INVERTED EXCLAMATION MARK (U+00A1)
; @
; #
; £
; $
; %
; ^
&::Send ⅋{Left} ; - TURNED AMPERSAND (U+214B)
; *

"::Send „{Left} ; - DOUBLE LOW9 QUOTATION MARK (U+201E)
'::Send ,{Left} ; - COMMA (U+002C)

(::Send ){Left} ; - RIGHT PARENTHESIS (U+0029)
)::Send ({Left} ; - Left PARENTHESIS
<::Send >{Left} ; - Greater THAN SIGN (U+003E)
>::Send <{Left} ; - Less than sign
{::Send {}}{Left} ; - RIGHT CURLY BRACKET (U+007D)
}::Send {{}{Left} ; - Left CURLY BRACKET
[::Send ]{Left} ; - RIGHT SQUARE BRACKET (U+005D)
]::Send [{Left} ; - Left SQUARE BRACKET

.::Send ˙{Left} ; - DOT ABOVE (U+02D9)
`;::Send ؛{Left} ; - ARABIC SEMICOLON (U+061B)
?::Send ¿{Left} ; - INVERTED QUESTION MARK (U+00BF)
_::Send ‾{Left} ; - OVERLINE (U+203E)

; Numbers
0::Send 0{Left} ; - Identical
1::Send Ɩ{Left} ; - iota
2::Send ᄅ{Left} ; - hangul choseong rieul (U+1105)
3::Send Ɛ{Left} ; - LATIN CAPITAL LETTER OPEN E (U+0190)
4::Send ᔭ{Left} ; - CANADIAN SYLLABICS YA (U+152D)
5::SEND ϛ{Left} ; - ; Stigma (ligature)
6::Send 9{Left} ; - DIGIT NINE (U+0039)
7::Send Ɫ{Left} ; - LATIN CAPITAL LETTER L WITH MIDDLE TILDE (U+2C62)
8::Send 8{Left} ; - Identical
9::Send 6{Left} ; - Digit Six

; Capitalised Latin Letters
+A::Send ∀{Left} ; - FOR ALL (U+2200)
+B::Send 𐐒{Left} ; - DESERET CAPITAL LETTER BEE (U+10412)
+C::Send Ↄ{Left} ; - ROMAN NUMERAL REVERSED ONE HUNDRED (U+2183)
+D::Send ◖{Left} ; - LEFT HALF BLACK CIRCLE (U+25D6)
+E::Send Ǝ{Left} ; - LATIN CAPITAL LETTER REVERSED E (U+018E)
+F::Send Ⅎ{Left} ; - TURNED CAPITAL F (U+2132)
+G::Send ⅁{Left} ; - TURNED SANSSERIF CAPITAL G (U+2141)
+H::Send H{Left} ; - Identical
+I::Send I{Left} ; - Identical
+J::Send ſ{Left} ; - LATIN SMALL LETTER LONG S (U+017F)
+K::Send ⋊{Left} ; - RIGHT NORMAL FACTOR SEMIDIRECT PRODUCT (U+22CA)
+L::Send ⅂{Left} ; - TURNED SANSSERIF CAPITAL L (U+2142)
+M::Send W{Left} ; - LATIN CAPITAL LETTER W (U+0057)
+N::Send ᴎ{Left} ; - LATIN LETTER SMALL CAPITAL REVERSED N (U+1D0E)
+O::Send O{Left} ; - Identical
+P::Send Ԁ{Left} ; - CYRILLIC CAPITAL LETTER KOMI DE (U+0500)
+Q::Send Ό{Left} ; - GREEK CAPITAL LETTER OMICRON WITH TONOS (U+038C)
+R::Send ᴚ{Left} ; - LATIN LETTER SMALL CAPITAL TURNED R (U+1D1A)
+S::Send Ƨ{Left} ; - https://en.wikipedia.org/wiki/%C6%A7
+T::Send ⊥{Left} ; - UP TACK (U+22A5)
+U::Send ∩{Left} ; - INTERSECTION (U+2229)
+V::Send ᴧ{Left} ; - GREEK LETTER SMALL CAPITAL LAMDA (U+1D27)
+W::Send M{Left} ; - Latin capital letter M
+X::Send X{Left} ; - Identical
+Y::Send ⅄{Left} ; - TURNED SANSSERIF CAPITAL Y (U+2144)
+Z::Send Z{Left} ; - ; FIXME

; Lowercase Latin Letters
a::Send ɐ{Left} ; - LATIN SMALL LETTER TURNED A (U+0250)
b::Send q{Left} ; - LATIN SMALL LETTER Q (U+0071)
c::Send ɔ{Left} ; - LATIN SMALL LETTER OPEN O (U+0254)
d::Send p{Left} ; - LATIN SMALL LETTER P (U+0070)
e::Send ǝ{Left} ; - LATIN SMALL LETTER TURNED E (U+01DD)
f::Send ɟ{Left} ; - LATIN SMALL LETTER DOTLESS J WITH STROKE (U+025F)
g::Send ƃ{Left} ; - LATIN SMALL LETTER B WITH TOPBAR (U+0183)
h::Send ɥ{Left} ; - LATIN SMALL LETTER TURNED H (U+0265)
; i::Send ı{Left} ; - LATIN SMALL LETTER DOTLESS I (U+0131)
i::Send !{Left} ; - Exclamation mark
j::Send ɾ{Left} ; - LATIN SMALL LETTER R WITH FISHHOOK (U+027E)
k::Send ʞ{Left} ; - LATIN SMALL LETTER TURNED K (U+029E)
l::Send ʃ{Left} ; - LATIN SMALL LETTER ESH (U+0283)
m::Send ɯ{Left} ; - LATIN SMALL LETTER TURNED M (U+026F)
n::Send u{Left} ; - LATIN SMALL LETTER U (U+0075)
o::Send o{Left} ; - Identical
p::Send p{Left} ; - ; FIXME
q::Send q{Left} ; - ; FIXME
r::Send ɹ{Left} ; - LATIN SMALL LETTER TURNED R (U+0279)
s::Send ƨ{Left} ; - minuscule https://en.wikipedia.org/wiki/%C6%A7
t::Send ʇ{Left} ; - LATIN SMALL LETTER TURNED T (U+0287)
u::Send n{Left} ; - Latin lowercase n
v::Send ʌ{Left} ; - LATIN SMALL LETTER TURNED V (U+028C)
w::Send ʍ{Left} ; - LATIN SMALL LETTER TURNED W (U+028D)
x::Send x{Left} ; - Identical
y::Send ʎ{Left} ; - LATIN SMALL LETTER TURNED Y (U+028E)
z::Send z{Left} ; - ; FIXME

#If
