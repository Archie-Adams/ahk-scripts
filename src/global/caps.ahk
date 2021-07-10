#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.

; To disable CAPS for use as a mofifier key.
#SingleInstance, Force

SetCapsLockState, AlwaysOff

; Allow normal CapsLock functionality to be toggled by Alt+CapsLock:
!CapsLock::
   GetKeyState, capsstate, CapsLock, T ;(T indicates a Toggle. capsstate is an arbitrary varible name)
   if capsstate = U
      SetCapsLockState, AlwaysOn
   else
      SetCapsLockState, AlwaysOff
   return