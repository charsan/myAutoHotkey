#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; #InstallKeybdHook
#UseHook

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 1段目
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
sc029::Send,{``}  ;         半角/全角     → `
+sc029::Send,{~}  ; shift + 半角/全角     → ~
+2::Send,{@}      ; shift + 2           " → @
+6::Send,{^}      ; shift + 6           & → ^
+7::Send,{&}      ; Shift + 7           ' → &
+8::Send,{*}      ; Shift + 8           ( → *
+9::Send,{(}      ; Shift + 9           ) → (
+0::Send,{)}      ; Shift + 0             → )
+-::Send,{_}      ; Shift + -           = → _
^::Send,{=}       ;                     ^ → =
+^::Send,{+}      ; Shift + ^           ~ → +

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 2段目
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@::[              ;         @           @ → [  ; sendにすると、normalモードに抜けられなくなる。（理由を調査中）
+@::{             ; Shift + @           ` → {
[::]              ;         [           [ → ]
+[::Send,{}}      ; Shift + [           { → }

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 3段目
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
+;::Send,{:}      ; Shift + ;           + → :
:::Send,{'}       ;                     : → '
*::Send,{"}       ; Shift + :           * → "
]::\              ;                     ] → \
+]::|             ; Shift + ]           } → |

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; vscodeVimでnormalモードに移行したらIMEオフ
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
$^@::                                           ; $^[とはしない。AutoHotkeyの設定よりもキーボード配列を優先して読み込むため、想定通り動作しない。（詳細不明）
 Send, ^[
 Sleep, 1
 Send, {vk1Dsc07B}                              ; vk1Dsc07Bは無変換。無変換キーにIMEオフ機能を割り当て。

return
