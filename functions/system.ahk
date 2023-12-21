sleep_pc() {
  DllCall("PowrProf\SetSuspendState", "int", 0, "int", 1, "int", 0)
}

hibernate_pc() {
  DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
}

shutdown_pc() {
  ; https://www.autohotkey.com/docs/v1/lib/Shutdown.htm
  Shutdown, 9
}

reboot_pc() {
  ; https://www.autohotkey.com/docs/v1/lib/Shutdown.htm
  Shutdown, 2
}

mute() {
  Send {Volume_Mute}  ; Mute/unmute the master volume.
}

toggle_mute() {
  SoundSet, +1,, Mute
}

reload_command_palette() {
  Reload
}
