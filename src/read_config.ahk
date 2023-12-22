palette_getConfigObject() {
  FileRead, configString, %A_ScriptDir%/command_palette_config.json
  if ErrorLevel ; Successfully loaded.
  {
    MsgBox % "Error loading config file."
  }
  return JSON.parse(configString)
}

palette_getCssFromConfig(config) {

}