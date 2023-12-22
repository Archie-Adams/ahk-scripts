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
#Include %A_ScriptDir%/src/parse_config.ahk
#Include %A_ScriptDir%/src/parse_commands.ahk
#Include %A_ScriptDir%/src/setup_neutron.ahk
#Include %A_ScriptDir%/src/quicksort_object_array.ahk

; ---------------------------------------------------------------------------- ;
;                                     Setup                                    ;
; ---------------------------------------------------------------------------- ;

config := palette_getConfigObject()

global palette_allCommands := palette_parseCommands()
global palette_shownCommands := palette_allCommands
global palette_selectedCommand := 1

global palette_enableShiftJAndKNavigation := config.enableShiftJAndKNavigation
global palette_scale := config.style.scale

neutron := ""
css := palette_generateCssFromConfig(config)
palette_setupNeutron(neutron, css, palette_scale)
palette_updateShownCommands(neutron, "")

showPaletteHotkey := config.hotkey ? config.hotkey : !Space
Hotkey, %showPaletteHotkey%, showCommandPalette

; Free the memory.
css := ""
config := ""
showPaletteHotkey := ""

; App icon found at:
; https://icon-icons.com/icon/Shipping-delivery-carry-palette/108568
Menu, Tray, Icon, src/command_palette.ico

; Include commands file at the end of the autoexecute section as they block.
#Include %A_ScriptDir%/commands.ahk

showCommandPalette:
neutron.qs("#input").innerText := ""
palette_updateShownCommands(neutron, "")
neutron.Show()
return

NeutronClose:
ExitApp
return

; ---------------------------------------------------------------------------- ;

; ---------------------------------------------------------------------------- ;
;                             Interaction Functions                            ;
; ---------------------------------------------------------------------------- ;

palette_setWindowHeight(neutron, height) {
  neutron.Show("w" palette_scale * 40 "h" height)
}

palette_updateShownCommands(neutron, searchquery) {
  palette_shownCommands := []

  ; There is a two step update process here.
  ; 1: A regex filter of the total command array such that only commands whose
  ;    name contains the characters of the search query in order are kept.
  ; 2: The reultant list is quick sorted based on the Levenshtein Distance of
  ;    the command names and the search query.

  ; Step 1: Regex filter.
  Needle_Temp := RegExReplace(searchquery, "(.)", "\Q$1\E.*")
  Needle_Temp := "i)" Needle_Temp
  for key, command in palette_allCommands
    if RegExMatch(command["name"], Needle_Temp) {
      palette_shownCommands.Push({"command": command
        , "distance": LevenshteinDistance(searchquery, command["name"])})
    }

  ; Step 2: Sort the filtered commands by their Levenshtein Distance.
  palette_quicksortObjectArray(palette_shownCommands, "distance")

  list := neutron.qs("#list")
  list.innerHTML := ""

  if (palette_shownCommands.Length() == 0) {
    html := "<p class=" """" "empty" """" ">no commands found<p>"
    list.innerHTML := html
    return
  }

  for i, command in palette_shownCommands {
    list.innerHTML := list.innerHtml command["command"]["html"]
  }

  palette_setFocusedCommand(neutron, 1)
}

palette_setFocusedCommand(neutron, newFocusedCommandIndex) {
  if (newFocusedCommandIndex < 1) {
    palette_selectedCommand := 1
  } else if (newFocusedCommandIndex > palette_shownCommands.Length()) {
    palette_selectedCommand := palette_shownCommands.Length()
  } else {
    palette_selectedCommand := newFocusedCommandIndex
  }

  commandDivs := neutron.doc.querySelectorAll(".command")

  for i, div in neutron.Each(commandDivs)
  {
    ; Selected command is 1 based as per it's array, apparently i is not.
    if (i == palette_selectedCommand - 1)
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

~Up::palette_setFocusedCommand(neutron, palette_selectedCommand - 1)
~Down::palette_setFocusedCommand(neutron, palette_selectedCommand + 1)

~Esc::neutron.Hide()

; TODO: Commands which require a parameter - i.e. a search string,
;       get the parameter by having the user type in the input box again.
;       Change the '>' to be the name of the needed parameter.
~Enter::
if (palette_selectedCommand == 0) {
  return
}
function := palette_shownCommands[palette_selectedCommand]["command"].function
neutron.Hide()
%function%()
function := ""
return

#if

#if WinActive("ahk_id" neutron.hWnd) and palette_enableShiftJAndKNavigation

+k::palette_setFocusedCommand(neutron, palette_selectedCommand - 1)
+j::palette_setFocusedCommand(neutron, palette_selectedCommand + 1)

#if
