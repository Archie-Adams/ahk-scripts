palette_getConfigObject() {
  FileRead, configString, %A_ScriptDir%/command_palette_config.json
  if ErrorLevel ; Successfully loaded.
  {
    MsgBox % "Error loading config file."
  }
  return JSON.parse(configString)
}

; TODO: pass by ref, but actually, 
palette_generateCssFromConfig(ByRef config) {
  background := config.style.background ; Default: "#414446"
  commandInput := config.style.commandInput ; Default: "#faebd7"
  borders := config.style.borders ; Default: "#faebd7"
  commandListText := config.style.commandListText ; Default: "#faebd7"
  emptyColour := config.style.emptyColour ; Default: "#e25259"
  focusedCommand := config.style.focusedCommand ; Default: "#ff0000"
  baseFontSize := config.style.baseFontSize ; Default: "16"
  fontFamily := config.style.fontFamily ; Default: "Gadugi Candara Consolas"
  customCssString := config.style.customCssString ; Default: ""
  
  ; TODO: Add module to the css
  ; FIXME: Build the string and exclude null config.
  css =
  (
  body {
    background-color: %background%;
    font-family: %fontFamily%;
  }
  body #palette {
    border: 1px solid %borders%;
  }
  body #palette #search {
    border-bottom: 1px solid %borders%;
  }
  body #palette #search .input-container input {
    background: %background%;
    color: %commandInput%;
  }
  body #palette #list .empty {
    color: %emptyColour%;
  }
  body #palette #list .command {
    color: %commandListText%;
  }
  body #palette #list .command.focused {
    background-color: %focusedCommand%;
  }
  %customCssString%
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
  return css
}
