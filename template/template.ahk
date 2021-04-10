/* -------------------------------------------------------------------------- */
/*                                template.ahk                                */
/* -------------------------------------------------------------------------- */
/*                            Author: Archie Adams                            */
/*                       Source: https://www.google.com/                      */
/* -------------------------------------------------------------------------- */
/*            This is a short description of what this script does.           */
/*                     It is okay to be a few lines long.                     */
/* -------------------------------------------------------------------------- */
*/


; 2 = A window's title can contain WinTitle anywhere inside it to be a match.
SetTitleMatchMode, 2
#ifwinactive SomeTitle ahk_class SomeClass

;  -------------------------------- Help file -------------------------------  ;
>!/::
If (WinActive("template-help.html - Google Chrome")) {
  Send, ^w
} Else {
  Run, "template-help.html"
}
Return
;  --------------------------------------------------------------------------  ;
