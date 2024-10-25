SendMode Input
StringCaseSense, On
#InstallKeybdHook

; Keep in mind that the script is based on the Swedish keyboard layout.
; +    : Shift
; <^>! : AltGr

; Various combining characters
¨::Send {U+0308} ;diaeresis ä
+¨::Send {U+0302} ;circumflex â
<^>!¨::Send {U+0303} ;tilde ã
´::Send {U+0301} ;acute á
+´::Send {U+0300} ;grave à
<^>!´::Send {U+030B} ;double acute a̋
<^>!+´::Send {U+030F} ;double grave ȁ
<^>!'::Send {U+0309} ;hook ả
<^>!-::Send {U+0304} ;macron ā
<^>!+.::Send {U+0307} ;dot ȧ
<^>!,::Send {U+0327} ;hook a̧
<^>!+,::Send {U+0328} ;ogonek ą
<^>!1:: Send {U+030D} ;vertical line a̍
<^>!+1:: Send {U+030E} ;double vertical line a̎
<^>!+0::Send {U+030A} ;ring å
<^>!+7::Send {U+035B} ;zigzag a͛
<^>!+5::Send {U+033D} ;x a̽
+Space::Send {U+200C} ;ZWNJ

; Workarounds for overridden keys
<^>!§::Send {U+007C} ; |
<^>!+¨::Send {U+005E} ; ^
<^>!+s::Send {U+007E} ; ~

; Non-Swedish characters
<^>!ä::Send {U+00E6} ; æ
<^>!+ä::Send {U+00C6} ; Æ
<^>!ö::Send {U+00F8} ; ø
<^>!+ö::Send {U+00D8} ; Ø
<^>!t::Send {U+00FE} ; þ
<^>!+t::Send {U+00DE} ; Þ
<^>!d::Send {U+00F0} ; ð
<^>!+d::Send {U+00D0} ; Ð
<^>!s::Send {U+00DF} ; ß
<^>!+8::Send {U+2039} ; ‹
<^>!+9::Send {U+203A} ; ›
<^>!<::Send {U+00AB} ; «
<^>!+<::Send {U+00BB} ; »

; Capitalizes the selected text
<^>!k::
Send +{Right}
Send ^c
Sleep, 50
StringUpper, clipboard, clipboard
clipboard := StrReplace(clipboard, "ı", "I")
clipboard := StrReplace(clipboard, "ȷ", "J")
Send ^v
return

; As above, but converts to lowercase
<^>!l::
Send +{Right}
Send ^c
Sleep, 50
clipboard := StrReplace(clipboard, "I", "ı")
clipboard := StrReplace(clipboard, "J", "ȷ")
StringLower, clipboard, clipboard
Send ^v
return

; Replace periods with middle dots
<^>!.::
Send +{Right}
Send ^c
Sleep, 50
clipboard := StrReplace(clipboard, ".", "·")
Send ^v
return

; Convert selected text to title case
<^>!m::
Send +{Right}
Send ^c
Sleep, 50
StringUpper, clipboard, clipboard, T
clipboard := StrReplace(clipboard, " ı", " I")
clipboard := StrReplace(clipboard, " ȷ", " J")
Send ^v
return

; Replace I with J and U with W
<^>!j::
Send +{Right}
Send ^c
Sleep, 50
clipboard := StrReplace(clipboard, "ı", "ȷ")
clipboard := StrReplace(clipboard, "i", "j")
clipboard := StrReplace(clipboard, "I", "J")
clipboard := StrReplace(clipboard, "u", "w")
clipboard := StrReplace(clipboard, "U", "W")
Send ^v
return

; As above, but the other way around
<^>!i::
Send +{Right}
Send ^c
Sleep, 50
clipboard := StrReplace(clipboard, "ȷ", "ı")
clipboard := StrReplace(clipboard, "j", "i")
clipboard := StrReplace(clipboard, "J", "I")
clipboard := StrReplace(clipboard, "w", "u")
clipboard := StrReplace(clipboard, "W", "U")
Send ^v
return

; Remove dots from I and J
<^>!o::
Send +{Right}
Send ^c
Sleep, 50
clipboard := StrReplace(clipboard, "i", "ı")
clipboard := StrReplace(clipboard, "j", "ȷ")
Send ^v
return

; Undo above
<^>!u::
Send ^c
Sleep, 50
clipboard := StrReplace(clipboard, "ı", "i")
clipboard := StrReplace(clipboard, "ȷ", "j")
Send ^v
return
