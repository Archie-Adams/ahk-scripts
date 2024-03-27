open_folder_downloads() {
  EnvGet, hdrive, Homedrive
  EnvGet, hpath, Homepath
  Run, % hdrive hpath "\Downloads"
}

open_folder_documents() {
  EnvGet, hdrive, Homedrive
  EnvGet, hpath, Homepath
  Run, % hdrive hpath "\Documents"
}

open_folder_OneDrive() {
  EnvGet, hdrive, Homedrive
  EnvGet, hpath, Homepath
  Run, % hdrive hpath "\OneDrive"
}

open_folder_OneDrive_UoL() {
  EnvGet, hdrive, Homedrive
  EnvGet, hpath, Homepath
  Run, % hdrive hpath "\OneDrive - University of Leeds\u"
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

open_folder_startup() {
  Run shell:startup
}

open_folder_recycle_bin() {
  ; https://www.autohotkey.com/board/topic/8661-how-to-open-the-recycle-bin/#:~:text=Run%20%3A%3A%7B645FF040%2D5081%2D101B%2D9F08%2D00AA002F954E%7D
  Run ::{645FF040-5081-101B-9F08-00AA002F954E}
}
