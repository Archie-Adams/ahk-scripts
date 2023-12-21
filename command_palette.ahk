; command_palette.ahk v0.0.0
; Copyright (c) 2023 Archie Adams
; TODO: GitHub URL
;
; MIT License
;
; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:
;
; The above copyright notice and this permission notice shall be included in all
; copies or substantial portions of the Software.
;
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
; SOFTWARE.
;

#NoEnv
#SingleInstance Force
SetBatchLines, -1

#Include %A_ScriptDir%/lib/Neutron.ahk
#Include %A_ScriptDir%/lib/Json.ahk

#Include %A_ScriptDir%/src/levenshtein_distance.ahk

; TODO: Learn how to use pointers in AHK and split this file into functions in
;       a src/ directory to clean the code up.

; ---------------------------------------------------------------------------- ;
;                                  Load Config                                 ;
; ---------------------------------------------------------------------------- ;

; Load config
FileRead, configString, %A_ScriptDir%/command_palette_config.json
if ErrorLevel ; Successfully loaded.
{
  MsgBox % "Error loading config file."
}
config := JSON.parse(configString)
configString := "" ; Free the memory.

style_background := config.style.background ; Default: "#414446"
style_commandInput := config.style.commandInput ; Default: "#faebd7"
style_borders := config.style.borders ; Default: "#faebd7"
style_commandListText := config.style.commandListText ; Default: "#faebd7"
style_emptyColour := config.style.emptyColour ; Default: "#e25259"
style_focusedCommand := config.style.focusedCommand ; Default: "#ff0000"
style_baseFontSize := config.style.baseFontSize ; Default: "16"
style_fontFamily := config.style.fontFamily ; Default: "Gadugi Candara Consolas"
style_customCssString := config.style.customCssString ; Default: ""

global enableShiftJAndKNavigation := config.enableShiftJAndKNavigation

; TODO: Add module to the css
; FIXME: Build the string and exclude null config.
css =
(
body {
  background-color: %style_background%;
  font-family: %style_fontFamily%;
}
body #palette {
  border: 1px solid %style_borders%;
}
body #palette #search {
  border-bottom: 1px solid %style_borders%;
}
body #palette #search .input-container input {
  background: %style_background%;
  color: %style_commandInput%;
}
body #palette #list .empty {
  color: %style_emptyColour%;
}
body #palette #list .command {
  color: %style_commandListText%;
}
body #palette #list .command.focused {
  background-color: %style_focusedCommand%;
}
%style_customCssString%
)

; IDEA: Themes and switching themes support
; "style": {
;   "background": "#414446",
;   "commandInput": "#faebd7",
;   "borders": "#faebd7",
;   "commandListText": "#faebd7",
;   "focusedCommand": "#ff0000",
;   "baseFontSize": "16px",
;   "fontFamily": "Gadugi Candara Consolas"
; },

; Free the memory.
style_background := ""
style_commandInput := ""
style_borders := ""
style_commandListText := ""
style_focusedCommand := ""
style_fontFamily := ""
style_emptyColour := ""
style_customCssString := ""

if (!config.commands) {
  MsgBox % "No commands section in config: Exiting."
  ExitApp
}

; TODO: Add module
; TODO: Make nice looking hotkey.
commandHtmlTemplate =
(
  <div class="command">
    <div class="command-container">
      <div class="left-container">
        <p class="name">{}</p>
        <p class="module">{}</p>
      </div>
      <p class="hotkey">{}</p>
    </div>
  </div>
)

global CommandArray := []

defaultDescription := "No description was provided."

for i, obj in config.commands {
  commandObj := {name: obj["name"]
    , function: obj["function"]
    , hotkey: obj["hotkey"]
    , module: obj["module"]
    , description: obj["description"] ? obj["description"] : defaultDescription
    , html: Format(commandHtmlTemplate
      , obj["name"]
      , obj["module"]
      , obj["hotkey"])}
  CommandArray.Push(commandObj)
}

; Read user commands from commands.ahk
; Format we're looking for:

; TODO: change format from COMMAND| to NAME| and MODULE| so we know there is always
; a pipe to split on and even if null the strArray[2] will exist. Check it dosen't error anyway.
; ;COMMAND|Gog|run programs
; ;optional help description
; ;optionl description multiple lines
; #+x::function()

; TODO:
; Add DESC|
; Add PARAM| can have multiple if multiple parameters are needed.
; paramaters can only be done for functions that don't have a hotkey?
; or specify the hotkey and have it open the command palette with the command
; already ran and waiting for a pram input...
; Add FUNCTION|  for commands that don't have a hotkey.

couldBeDescription := false
currentScanning := false
currentName := ""
currentModule := ""
currentDesc := ""
currentFunction := ""
currentHotkey := ""
Loop, read, %A_ScriptDir%/commands.ahk
{
  if InStr(A_LoopReadLine, ";COMMAND|")
    {
    strArray := StrSplit(A_LoopReadLine, "|")
    currentName := strArray[2]
    currentModule := strArray[3]
    currentScanning := true
  }
  else if (currentScanning and SubStr(A_LoopReadLine, 1, 1) == ";")
  {
    currentDesc := currentDesc SubStr(A_LoopReadLine, 2)
  }
  else if (currentScanning and SubStr(A_LoopReadLine, 1, 1) == ":")
  {
    ; TODO: This is an expansion...
    ; MsgBox, name=%currentName%, mod=%currentModule%, desc=%currentDesc%
    MsgBox, "Expansions are not currently supported."
    currentScanning := false
  }
  else if (currentScanning)
  {
    ; TODO: This could be more robust.
    strArray := StrSplit(A_LoopReadLine, "::")
    currentFunction := SubStr(strArray[2], 1, -2)
    currentHotkey := strArray[1]
    currentScanning := false
    commandObj := {name: currentName
      , function: currentFunction
      , hotkey: currentHotkey
      , module: currentModule
      , description: currentDesc ? currentDesc : defaultDescription
      , html: Format(commandHtmlTemplate
        , currentName
        , currentModule
        , currentHotkey)}
    CommandArray.Push(commandObj)
    currentName := ""
    currentModule := ""
    currentDesc := ""
    currentFunction := ""
    currentHotkey := ""
  }
}

global ShownCommandsArray := CommandArray
global SelectedCommand := 1

ShowWindowHotkey := config.hotkey ? config.hotkey : !Space

; Free the memory.
config := ""
commandDiv := ""
containerDiv := ""
commandP := ""
hotkeyP := ""
closingTags := ""
start := ""

; Set app icon. Icon found at:
; https://icon-icons.com/icon/Shipping-delivery-carry-palette/108568
Menu, Tray, Icon, src/command_palette.ico

; ---------------------------------------------------------------------------- ;

; ---------------------------------------------------------------------------- ;
;                             Setup Neutron Window                             ;
; ---------------------------------------------------------------------------- ;

; Create a new NeutronWindow and navigate to the command palette HTML page
FileRead, html, %A_ScriptDir%/src/command_palette.html
if ErrorLevel  ; Successfully loaded.
{
	MsgBox % "Error loading command_palette.html."
}
neutron := new NeutronWindow(Format(html, style_baseFontSize, css))
html := ""
css := ""

; Use the Gui method to set a custom label prefix for GUI events. This code is
; equivalent to the line `Gui, name:+LabelNeutron` for a normal GUI.
neutron.Gui("+LabelNeutron")

; Show the Neutron window
; showing a bigger window first makes it appear above center screen.
; FIXME: Find a way to position relative to screen height properly.
global command_palette_width := style_baseFontSize * 40
height := style_baseFontSize * 45
options := "w" command_palette_width " h" height
neutron.Show(options) ; 720 = 45*16 = 45rem by default.
height := ""
options := ""
style_baseFontSize := ""

updateShownCommands(neutron, "")

Hotkey, %ShowWindowHotkey%, showCommandPalette

#Include %A_ScriptDir%/commands.ahk

showCommandPalette:
neutron.qs("#input").innerText := ""
updateShownCommands(neutron, "")
neutron.Show()
return

NeutronClose:
ExitApp
return

; ---------------------------------------------------------------------------- ;

; ---------------------------------------------------------------------------- ;
;                             Interaction Functions                            ;
; ---------------------------------------------------------------------------- ;

; Based on code examples by jeeswg.
; https://www.autohotkey.com/boards/viewtopic.php?t=64447
quickSortShownCommandsByLevenshteinDistanceInPlace() {
  ; Count the number of items to sort.
  ; Create a 'completed' array with that many items.
  ; Each time an item is confirmed as being in the correct place, mark the
  ; appropriate item in the 'completed' array as true.
  oDone := []
  Loop, % ShownCommandsArray.Length()
    oDone.Push(0)
  oDone.Push(1)

  vLen := ShownCommandsArray.Length()

  Loop, % vLen
  {
    vPos1 := vPos2 := vIsMatch := 0
    Loop, % vLen+1
    {
      if (A_Index = vLen+1)
      {
        if !vIsMatch
          break 2
        else
          break
      }
      if !vPos1 && !oDone[A_Index]
        vPos1 := A_Index, vIsMatch := 1
      if vPos1 && oDone[A_Index+1]
      && (vPos1 = A_Index)
      {
        oDone[A_Index] := 1
        vPos1 := vPos2 := 0
      }
      else if vPos1 && oDone[A_Index+1]
      {
        vPos2 := A_Index
        vPosPivot := Floor((vPos1+vPos2)/2)
        vPivot := ShownCommandsArray[vPosPivot]
        swapObjectKeys(ShownCommandsArray, vPosPivot, vPos2)
        vPosL := vPos1, vPosR := vPos2-1
        Loop
        {
          while (ShownCommandsArray[vPosL]["distance"] < vPivot["distance"])
            vPosL++
          while (ShownCommandsArray[vPosR]["distance"] >= vPivot["distance"])
            vPosR--
          if (vPosL > vPosR)
            break
          swapObjectKeys(ShownCommandsArray, vPosL, vPosR)
          vPosL++, vPosR--
        }
        swapObjectKeys(ShownCommandsArray, vPos2, vPosL)
        oDone[vPosL] := 1
        vPos1 := vPos2 := 0
      }
    }
  }
}

swapObjectKeys(oArray, vKey1, vKey2)
{
  local
  if (vKey1 = vKey2)
    return
  vTemp := oArray[vKey1]
  oArray[vKey1] := oArray[vKey2]
  oArray[vKey2] := vTemp
}

updateShownCommands(neutron, searchquery) {
  ShownCommandsArray := []

  ; There is a two step update process here.
  ; 1: A regex filter of the total command array such that only commands whose
  ;    name contains the characters of the search query in order are kept.
  ; 2: The reultant list is quick sorted based on the Levenshtein Distance of
  ;    the command names and the search query.

  ; Step 1: Regex filter.
  Needle_Temp := RegExReplace(searchquery, "(.)", "\Q$1\E.*")
  Needle_Temp := "i)" Needle_Temp
  for key, command in CommandArray
    if RegExMatch(command["name"], Needle_Temp) {
      ShownCommandsArray.Push({"command": command
        , "distance": LevenshteinDistance(searchquery, command["name"])})
    }

  ; Step 2: Sort the filtered commands by their Levenshtein Distance.
  quickSortShownCommandsByLevenshteinDistanceInPlace()
  
  list := neutron.qs("#list")
  list.innerHTML := ""

  if (ShownCommandsArray.Length() == 0) {
    html := "<p class=" """" "empty" """" ">no commands found<p>"
    list.innerHTML := html
    setFocusedCommand(neutron, 1)
    return
  }

  for i, command in ShownCommandsArray {
    list.innerHTML := list.innerHtml command["command"]["html"]
  }

  setFocusedCommand(neutron, 1)
}

setWindowHeight(neutron, height) {
  neutron.Show("w" command_palette_width "h" height)
}

setFocusedCommand(neutron, newFocusedCommandIndex) {
  if (newFocusedCommandIndex < 1) {
    SelectedCommand := 1
  } else if (newFocusedCommandIndex > ShownCommandsArray.Length()) {
    SelectedCommand := ShownCommandsArray.Length()
  } else {
    SelectedCommand := newFocusedCommandIndex
  }

  commandDivs := neutron.doc.querySelectorAll(".command")

  for i, div in neutron.Each(commandDivs)
  {
    ; Selected command is 1 based as per it's array, apparently i is not.
    if (i == SelectedCommand - 1)
    {
      div.className := "command focused"
    } else {
      div.className := "command"
    }
  }
}

; ---------------------------------------------------------------------------- ;

; ---------------------------------------------------------------------------- ;
;                           Define UI Control Hotkeys                          ;
; ---------------------------------------------------------------------------- ;

; Hotkeys are only active while the command palette window is focused.
#if WinActive("ahk_id" neutron.hWnd)

~Up::setFocusedCommand(neutron, SelectedCommand - 1)
~Down::setFocusedCommand(neutron, SelectedCommand + 1)

~Esc::neutron.Hide()

; TODO: Commands which require a parameter - i.e. a search string,
;       get the parameter by having the user type in the input box again.
;       Change the '>' to be the name of the needed parameter.
~Enter::
if (SelectedCommand == 0) {
  return
}
function := ShownCommandsArray[SelectedCommand]["command"].function
neutron.Hide()
%function%()
function := ""
return

#if

#if WinActive("ahk_id" neutron.hWnd) and enableShiftJAndKNavigation

+k::setFocusedCommand(neutron, SelectedCommand - 1)
+j::setFocusedCommand(neutron, SelectedCommand + 1)

#if
