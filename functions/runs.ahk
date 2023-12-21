run_gog() {
  Run, "C:\Program Files (x86)\GOG Galaxy\GalaxyClient.exe"
}

run_microsoft_word() {
  Run, "C:\Program Files\Microsoft Office\root\Office16\WINWORD.EXE"
}

run_sublime_text_3() {
  Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Sublime Text 3"
}

run_youtube_subscriptions_chrome() {
  Run, chrome.exe "https://www.youtube.com/feed/subscriptions"
}

run_duolingo_chrome() {
  Run, chrome.exe "https://www.duolingo.com/learn"
}

run_outlook_chrome() {
  Run, chrome.exe "https://outlook.office.com/mail/inbox"
}

run_linkedin_profile_chrome() {
  Run, chrome.exe "https://www.linkedin.com/"
}

run_onenote() {
  Run, "C:\Program Files\Microsoft Office\Root\Office16\ONENOTE.exe"
}

run_google_photos_chrome() {
  Run, chrome.exe "https://photos.google.com/"
}

run_msi_afterburner() {
  Run, "C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe"
}

; TODO: Have a gobabl AppData path
run_discord() {
  Run, "C:\Users\archi\AppData\Local\Discord\Update.exe" --processStart Discord.exe
}

run_microsoft_teams() {
  Run, "C:\Users\archi\AppData\Local\Microsoft\Teams\Update.exe" --processStart Teams.exe
}

run_gmail_chrome() {
  Run, chrome.exe "https://mail.google.com/mail/u/0/#inbox"
}

run_google_calendar_chrome() {
  Run, chrome.exe "https://calendar.google.com/calendar/r"
}

run_chrome() {
  Run, chrome.exe
}

run_vscode() {
  Run, "C:\Users\archi\AppData\Local\Programs\Microsoft VS Code\Code.exe"
}

run_github_chrome() {
  Run, chrome.exe "https://github.com/"
}

run_netflix_chrome() {
  Run, chrome.exe "https://www.netflix.com/browse"
}

run_google_maps_chrome() {
  Run, chrome.exe "https://www.google.com/maps"
}

run_powershell() {
  Run shell:AppsFolder\Microsoft.WindowsTerminal_8wekyb3d8bbwe!App
}
