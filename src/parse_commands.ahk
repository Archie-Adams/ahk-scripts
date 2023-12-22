; TODO:
; Add PARAM| can have multiple if multiple parameters are needed.
; paramaters can only be done for functions that don't have a hotkey?
; or specify the hotkey and have it open the command palette with the command
; already ran and waiting for a pram input...

palette_parseCommands() {
  CommandArray := []

  template =
  (
    <div class="command">
      <div class="command-container">
        <div class="left-container">
          <p class="name">{}</p>
          <p class="module">{}</p>
        </div>
        <p class="hotkey">{}</p>
      </div>
      <p class="description">{}</p>
    </div>
  )

  defaultDescription := "No description was provided."

  command := ""
  _resetCommand(command)

  Loop, read, %A_ScriptDir%/commands.ahk
  {
    if InStr(A_LoopReadLine, ";NAME|")
    {
      command["name"] := SubStr(A_LoopReadLine, 7)
    }
    else if (InStr(A_LoopReadLine, ";MODULE|"))
    {
      command["module"] := SubStr(A_LoopReadLine, 9)
    }
    else if (InStr(A_LoopReadLine, ";DESC|"))
    {
      command["desc"] := command["desc"] SubStr(A_LoopReadLine, 7)
    }
    else if (currentScanning and SubStr(A_LoopReadLine, 1, 1) == ":")
    {
      ; TODO: This is an expansion...
      MsgBox, "Expansions are not currently supported."
    }
    else if (InStr(A_LoopReadLine, ";FUNCTION|"))
    {
      command["function"] := SubStr(A_LoopReadLine, 10)
      if (command["name"] == "") {
        MsgBox "you need to add a name before each function."
        _resetCommand(command)
      } else if (command["module"] == "") {
        MsgBox "you need to add a module before each function"
      } else {
        if command["desc"] == ""
          command["desc"] := defaultDescription
        _generateCommandHtml(command, template)
        ; TODO: Check nulls
        CommandArray.Push(command)
        _resetCommand(command)
      }
    }
    else if (InStr(A_LoopReadLine, "::") && InStr(A_LoopReadLine, "()"))
    {
      strArray := StrSplit(A_LoopReadLine, "::")
      command["function"] := SubStr(strArray[2], 1, -2)
      command["hotkey"] := strArray[1]
      ; TODO: Check nulls
      _generateCommandHtml(command, template)
      CommandArray.Push(command)
      _resetCommand(command)
    }
  }

  return CommandArray
}

_resetCommand(ByRef command) {
  command := {"name": ""
    , "desc": ""
    , "module": ""
    , "function": ""
    , "hotkey": ""
    , "html": ""}
}

_generateCommandHtml(ByRef command, ByRef template) {
  command["html"] := Format(template
  , command["name"]
  , command["module"]
  , _generateHotkeyHtml(command["hotkey"])
  , command["desc"])
}

_generateHotkeyHtml(hotkey) {
  ; TODO: Make nice looking hotkey.
  return hotkey
}