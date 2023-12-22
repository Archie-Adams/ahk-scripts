palette_setupNeutron(ByRef neutron, ByRef css, scale) {
  ; Create a new NeutronWindow and navigate to the command palette HTML page
  FileRead, html, %A_ScriptDir%/src/command_palette.html
  if ErrorLevel  ; Successfully loaded.
  {
    MsgBox % "Error loading command_palette.html."
  }
  neutron := new NeutronWindow(Format(html, scale, css))

  ; Use the Gui method to set a custom label prefix for GUI events. This code is
  ; equivalent to the line `Gui, name:+LabelNeutron` for a normal GUI.
  neutron.Gui("+LabelNeutron")

  ; Show the Neutron window
  ; showing a bigger window first makes it appear above center screen.
  ; FIXME: Find a way to position relative to screen height properly.
  width := scale * 40
  height := scale * 45
  options := "w" width " h" height
  neutron.Show(options) ; 720 = 45*16 = 45rem by default.
}
