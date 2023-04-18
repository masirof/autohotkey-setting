#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#InstallKeybdHook ;for debug key history
#HotkeyModifierTimeout, 100
#UseHook on


; vkeb is 無変換(デスクトップの場合hhkb)
; vl1d is 無変換(ノートパソコン)
vkeb & j::Send, {Blind}{down}
vkeb & k::Send, {Blind}{up}
vkeb & h::Send, {Blind}{left}
vkeb & l::Send, {Blind}{right} ;[;]p
; vkeb & p::Send, {Backspace} ;削除
; vkeb & [::Send, {BackSpace}
vkeb & vkba::Send, {Enter} ;無変換+;=削除
; vkeb & vkbb::Send, {Enter} ;無変換+;=削除
; vkeb & c::Send, {alt} ;無変換+;=削除
; キーリピート(押しっぱなし)が発生する

; vkeb & tab::send, {Blind}<#{tab}<
vkeb & tab::#Tab ;無変換+tab = win+tab
vkeb & d::alttab ;無変換+d = alt+tab
vkeb & Space::!Space

vkeb & x::Send, {F5}
vkeb & /::Send, {F12}
vkeb & e::#e ;無変換+e = win+e
vkeb & v::#v
vkeb & r::#r
; vkeb & tab::Send, {esc}

; end desktop keyboard


; ノートパソコン
vk1d & j::Send, {Blind}{down}
vk1d & k::Send, {Blind}{up}
vk1d & h::Send, {Blind}{left}
vk1d & l::Send, {Blind}{right} ;[;]p
; vk14::Ctrl
vk14::
    Send, {Blind}{Ctrl downtemp}
    KeyWait, vk14
    Send, {Blind}{Ctrl up}
    Return
; vk1d & p::Send, {Backspace} ;削除
; vk1d & [::Send, {BackSpace}
vk1d & vkba::Send, {Enter} ;無変換+;=削除

; vk1d & vkbb::Send, {Enter} ;無変換+;=削除
; vk1d & c::Send, {alt} ;無変換+;=削除
; キーリピート(押しっぱなし)が発生する


; vk1d & tab::send, {Blind}<#{tab}<
vk1d & tab::#Tab ;無変換+tab = win+tab
vk1d & d::alttab ;無変換+d = alt+tab
vk1d & Space::!Space

vk1d & x::Send, {F5}
vk1d & /::Send, {F12}
vk1d & e::#e ;無変換+e = win+e
vk1d & v::#v
vk1d & r::#r
; vk1d & tab::Send, {esc}

vk1d & c::
    Send, {Blind}{alt downtemp}
    KeyWait, c
    Send, {Blind}{alt up}
    Return

; かな ahk reload
vk16:: Reload

; f13 ahk pause
f13:: Pause


; vkf2 is カタカナひらがなローマ字
vkff::Send, {Enter}
; vk1c::Send, {Enter}

;vka5(corne chocolate Ralt)
; Ralt+escape押してしまうのでRalt+tabに変更
vka5 & Escape::!Tab


vkeb & c::
    Send, {Blind}{alt downtemp}
    KeyWait, c
    Send, {Blind}{alt up}
    Return

vkeb & ,::
    if GetKeyState("Shift"){
        send {Blind}{Shift}
        send {Blind}{End}
        Return
    }else if GetKeyState("ctrl"){
        send {Blind}{ctrl}
        send {Blind}{End}
        Return
    }else{
        send {End}
        Return
    }
    Return

vkeb & m::
    if GetKeyState("Shift"){
        send {Blind}{Shift}
        send {Blind}{Home}
        Return
    }else if GetKeyState("ctrl"){
        send {Blind}{Ctrl}
        Send {Blind}{Home}
        Return
    }else{
        send {Home}
        Return
    }
    Return

vkeb::
KeyWait,vkeb,D, T0.2 ;2度押しでwindowsキー
if(!ErrorLevel){
    send {Blind}{lwin}
    Return
}
Return