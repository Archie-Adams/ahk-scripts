open_folder_downloads() {
  Run, C:\Users\archi\Downloads
}

open_folder_OneDrive() {
  run, C:\Users\archi\OneDrive ; TODO: Should use %A_UserName% for cross device compatability.
}

open_folder_OneDrive_UoL() {
  Run, "C:\Users\archi\OneDrive - University of Leeds\u"
}

open_folder_drive_E() {
  run, E:\
}

open_folder_drive_G() {
  run, G:\
}

open_folder_drive_C() {
  run, C:\
}

open_folder_drive_F() {
  run, F:\
}

open_folder_drive_D() {
  run, D:\
}

; TODO: Can this be generalised?
open_folder_documents() {
  Run, C:\Users\archi\Documents
}

open_folder_startup() {
  Run shell:startup
}