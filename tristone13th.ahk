; mouse
XButton1::^c
XButton2::^v

; ~
LShift & Esc::
    Send ~
Return

LShift & `;::
    Send :
Return

; volume up, down and mute
RShift & Up::Send {Volume_Up}
RShift & Down::Send {Volume_Down}
RShift::Send {Volume_Mute}

; specific key mapping for ctrl
; CapsLock & n::Send {Down}
; CapsLock & p::Send {Up}
CapsLock & BackSpace::Send {Delete}
CapsLock & p::
    If (WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe Code.exe"))
        Send {Ctrl Down}{Shift Down}{Tab Down}{Ctrl Up}{Shift Up}{Tab Up}
    Else
        Send ^p
return
CapsLock & n::
    If (WinActive("ahk_exe msedge.exe") or WinActive("ahk_exe Code.exe"))
        Send {Ctrl Down}{Tab Down}{Ctrl Up}{Tab Up}
    Else
        Send ^n
return
CapsLock & o::
    If (WinActive("ahk_exe msedge.exe"))
        Send ^t
    Else
        Send ^o
return
CapsLock & i::
    If (WinActive("ahk_exe msedge.exe"))
        Send ^w
    Else
        Send ^i
return
CapsLock & j::Send {Down}
CapsLock & k::Send {Up}
CapsLock & h::Send {Left}
CapsLock & l::Send {Right}

; specifig key mapping for win
LCtrl & c::Send ^c
LCtrl & x::Send ^x
LCtrl & s::Send ^s
LCtrl & z::Send ^z
LCtrl & a::Send ^a
LCtrl & v::Send ^v
LCtrl & f::Send ^f

; specific key mapping for left alt
LAlt & a::Send {&}
LWin & a::Send {&}
LAlt & d::Send {$}
LWin & d::Send {$}
LAlt & i::Send {!}
LWin & i::Send {!}
LAlt & s::Send {*}
LWin & s::Send {*}
LAlt & j::Send {(}
LWin & j::Send {(}
LAlt & k::Send {)}
LWin & k::Send {)}
LAlt & m::Send `%
LWin & m::Send `%
LAlt & n::Send {#}
LWin & n::Send {#}
LAlt & o::Send {@}
LWin & o::Send {@}
LAlt & u::Send {^}
LWin & u::Send {^}
LAlt & b::Send {``}
LWin & b::Send {``}
numMode := 0
LAlt & `;::
    if (numMode = 0)
        numMode := 1
    Else
        numMode := 0
Return
LWin & `;::
    if (numMode = 0)
        numMode := 1
    Else
        numMode := 0
Return

; specific key mapping for right alt
RAlt & a::Send {Blind}{LWin Down}{Down}{LWin Up}
RWin & a::Send {Blind}{LWin Down}{Down}{LWin Up}
RAlt & d::Send {Blind}{LWin Down}{Up}{LWin Up}
RWin & d::Send {Blind}{LWin Down}{Up}{LWin Up}
RAlt & s::AltTab
RWin & s::AltTab
RAlt & c::Send {Blind}{LWin Down}3{LWin Up}
RWin & c::Send {Blind}{LWin Down}3{LWin Up}
RAlt & w::Send {Blind}{LWin Down}7{LWin Up}
RWin & w::Send {Blind}{LWin Down}7{LWin Up}
RAlt & e::Send {Blind}{LWin Down}2{LWin Up}
RWin & e::Send {Blind}{LWin Down}2{LWin Up}
RAlt & f::Send {Blind}{LWin Down}1{LWin Up}
RWin & f::Send {Blind}{LWin Down}1{LWin Up}
RAlt & m::Send {Blind}{LWin Down}9{LWin Up}
RWin & m::Send {Blind}{LWin Down}9{LWin Up}
RAlt & n::Send {Blind}{LWin Down}0{LWin Up}
RWin & n::Send {Blind}{LWin Down}0{LWin Up}
RAlt & q::Send {Blind}{LAlt Down}{F4}{LAlt Up}
RWin & q::Send {Blind}{LAlt Down}{F4}{LAlt Up}
RAlt & r::Send {Blind}{LWin Down}5{LWin Up}
RWin & r::Send {Blind}{LWin Down}5{LWin Up}
RAlt & t::Send {Blind}{LWin Down}4{LWin Up}
RWin & t::Send {Blind}{LWin Down}4{LWin Up}
RAlt & v::Send {Blind}{LWin Down}6{LWin Up}
RWin & v::Send {Blind}{LWin Down}6{LWin Up}
RAlt & x::Send {Blind}{LWin Down}8{LWin Up}
RWin & x::Send {Blind}{LWin Down}8{LWin Up}

process(key){
    global numMode
    ; GetKeyState, sDown, Space, P
    GetKeyState, cDown, CapsLock, T
    GetKeyState, pcDown, CapsLock, P
    GetKeyState, lcDown, LCtrl
    GetKeyState, laDown, LAlt
    GetKeyState, lwDown, LWin
    GetKeyState, raDown, RAlt
    GetKeyState, rwDown, RWin
    GetKeyState, sDown, LShift
    ; capslock as a ctrl
    If (pcDown = "D"){
        Send {Blind}{LCtrl Down}%key%{LCtrl Up}
        SetCapsLockState % !cDown
    }
    ; left alt
    Else If (laDown = "D" or lwDown = "D"){
        Send {Blind}{LAlt Down}%key%{LAlt Up}
    }
    ; right alt
    Else If (raDown = "D" or rwDown = "D"){
        Send {Blind}{RAlt Down}%key%{RAlt Up}
    } 
    ; ctrl as itself
    Else If (lcDown = "D"){
        Send #{%key%}
    } 
    ; capslock as it self
    Else If (cDown = "D" or sDown = "D"){
        StringUpper, key, key
        Send %key%
    }
    ; space to shift, deprecated.
    ; Else If (sDown = "D"){
    ;     StringUpper, key, key
    ;     Send {Blind}{BackSpace}%key%
    ; }
    ; key as itself
    Else
        If (numMode = 1){
            If (key = "a")
                Send 1
            Else If (key = "s")
                Send 2
            Else If (key = "d")
                Send 3
            Else If (key = "f")
                Send 4
            Else If (key = "g")
                Send 5
            Else If (key = "h")
                Send 6
            Else If (key = "j")
                Send 7
            Else If (key = "k")
                Send 8
            Else If (key = "l")
                Send 9
            Else If (key = ";")
                Send 0
            Else
                Send %key%
        }
        Else
            Send %key%
}

*a::process("a")
*b::process("b")
*c::process("c")
*d::process("d")
*e::process("e")
*f::process("f")
*g::process("g")
*h::process("h")
*i::process("i")
*j::process("j")
*k::process("k")
*l::process("l")
*m::process("m")
*n::process("n")
*o::process("o")
*p::process("p")
*q::process("q")
*r::process("r")
*s::process("s")
*t::process("t")
*u::process("u")
*v::process("v")
*w::process("w")
*x::process("x")
*y::process("y")
*z::process("z")
*`;::process(";")