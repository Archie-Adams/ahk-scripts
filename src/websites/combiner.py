import glob

# Add file header:
header = """
SetCapsLockState, AlwaysOff

;  --------------------- CapsLock Tab Specific Hotkeys ----------------------  ;
;  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ;
; FIXME: only works with chrome.exe?
#if getkeystate("capslock", "p") && winactive("ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe")
;  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  ;

; BUG: On first time file load browser receives origanal clipboard.
sendJS(url, js)
{
  temp := clipboardall
  payload := url "~|sep|~" js
  clipboard := payload
  Send, ^+{Insert}
  clipboard := temp
}

"""

# Create arrays to store data.
shortcuts = [] # [("::S", ["line of ahk","line of ahk"])]

# Loop through files.
for file in glob.glob("./site-configs/*.ahk"):
    with open(file, 'r') as fd:
        currentShortcutIndex = -1
        for line in fd:
          if line == "": continue
          if line.strip()[-1:-3:-1] == "::":
            currentShortcutIndex = -1
            # Check if shortcut exists in array.
            for index, shortcut in enumerate(shortcuts):
              # If yes change shortcut index and continue
              if shortcut[0] == line.strip().upper():
                currentShortcutIndex = index
                continue
            # If no - append new shortcut, change shortcut index and continue
            if currentShortcutIndex == -1:
              shortcuts.append((line.strip().upper(),[]))
              currentShortcutIndex = len(shortcuts) - 1
          else:
            # Append line to array of shortcut index.
            shortcuts[currentShortcutIndex][1].append(line.strip())

# Write all outputs to websites.ahk
with open("./websites.ahk", "w") as f:
  f.write(header)
  for shortcut in shortcuts:
    f.write(shortcut[0] + "\n")
    for line in shortcut[1]:
      f.write(line + "\n")
    f.write("return\n")
