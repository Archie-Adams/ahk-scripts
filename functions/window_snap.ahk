; This file amalgamates Advanced Window Snap and Hyper Window Snap.

; IDEA: 2 thirds left or 2 thirds right snapping
; IDEA: Improved browser split that keeps the tab alive like:
;       https://chromewebstore.google.com/detail/tab-to-windowpopup-keyboa/adbkphmimfcaeonicpmamfddbbnphikh?pli=1
; IDEA: Layouts with the active window and the previous active window?
;       e.g: 2/3 + 1/3 split.

; TODO: Check this file - remove hyper win snap as is gpl and probably not needed.
; instead extend advanced window snap to snap window over multiple grid cols/rows

; TODO: Will probably need to use
;       https://www.autohotkey.com/boards/viewtopic.php?t=98890
;       and support execution of v1 scripts with a v1 tag on commnds that run
;       v1 functions?

/**
 * Advanced Window Snap
 * Snaps the Active Window to one of nine different window positions.
 *
 * @author Andrew Moore <andrew+github@awmoore.com>
 * @link https://gist.github.com/AWMooreCO/1ef708055a11862ca9dc
 * @version 1.1
 */

/**
 * Hyper Window Snap
 * Hyper Window Snap is an AutoHotkey script for moving and resizing windows
 * into quadrants, especially useful for 4k monitors.
 * Based on Advanced Window Snap by Andrew Moore.
 *
 * @author Andrew Moore <andrew+github@awmoore.com>
 * @author Jeff Axelrod <jeff+github@theaxelrods.com>
 * @link https://github.com/glenviewjeff/HyperWindowSnap
 * @version 1.0
 */

/**
 * Resizes and moves the active window to a given position on a grid
 * @param {integer} numRows   The number of rows in the grid
 * @param {integer} numCols   The number of columns in the grid
 * @param {integer} row       The row within the grid to place the window
 * @param {integer} col       The column within the grid to place the window
 *
 * @example (Snap a window to the left third of the screen)
 * SnapActiveWindowGrid(1, 3, 1, 1);
 *
 * @example (Snap a window to the bottom half of the screen)
 * SnapActiveWindowGrid(2, 1, 2, 1);
 */
SnapActiveWindowGrid(numRows, numCols, row, col) {
  WinGet activeWin, ID, A

  activeMon := GetMonitorIndexFromWindow(activeWin)

  SysGet, MonitorWorkArea, MonitorWorkArea, %activeMon%

  ; Determine the width and height
  height := (MonitorWorkAreaBottom - MonitorWorkAreaTop)/numRows
  width := (MonitorWorkAreaRight - MonitorWorkAreaLeft)/numCols

  ; Determine the x and y offsets
  posX  := MonitorWorkAreaLeft + (col - 1) * width
  posY  := MonitorWorkAreaTop + (row - 1) * height

  ; Use WinGetPosEx to determine position/size offsets
  ; (to remove gaps around windows).
  WinGetPosEx(activeWin, X, Y, realWidth, realHeight, offsetX, offsetY)

  ; Move and resize the active window.
  WinMove, A
    ,, (posX + offsetX)
    , (posY + offsetY)
    , (width + offsetX * -2)
    , (height + (offsetY - 2) * -2)
}

/**
 * GetMonitorIndexFromWindow retrieves the HWND (unique ID) of a given window.
 * @param {Uint} windowHandle
 * @author shinywong
 * @link http://www.autohotkey.com/board/topic/69464-how-to-determine-a-window-is-in-which-monitor/?p=440355
 */
GetMonitorIndexFromWindow(windowHandle) {
  ; Starts with 1.
  monitorIndex := 1

  VarSetCapacity(monitorInfo, 40)
  NumPut(40, monitorInfo)

  if (monitorHandle := DllCall("MonitorFromWindow", "uint", windowHandle, "uint", 0x2))
    && DllCall("GetMonitorInfo", "uint", monitorHandle, "uint", &monitorInfo) {
    monitorLeft   := NumGet(monitorInfo,  4, "Int")
    monitorTop    := NumGet(monitorInfo,  8, "Int")
    monitorRight  := NumGet(monitorInfo, 12, "Int")
    monitorBottom := NumGet(monitorInfo, 16, "Int")
    workLeft      := NumGet(monitorInfo, 20, "Int")
    workTop       := NumGet(monitorInfo, 24, "Int")
    workRight     := NumGet(monitorInfo, 28, "Int")
    workBottom    := NumGet(monitorInfo, 32, "Int")
    isPrimary     := NumGet(monitorInfo, 36, "Int") & 1

    SysGet, monitorCount, MonitorCount

    Loop, %monitorCount% {
      SysGet, tempMon, Monitor, %A_Index%

      ; Compare location to determine the monitor index.
      if ((monitorLeft = tempMonLeft)
        and (monitorTop = tempMonTop)
        and (monitorRight = tempMonRight)
        and (monitorBottom = tempMonBottom)) {
          monitorIndex := A_Index
          break
      }
    }
  }

  return %monitorIndex%
}

; Function: WinGetPosEx
;
; Description:
;
;   Gets the position, size, and offset of a window. See the *Remarks* section
;   for more information.
;
; Parameters:
;
;   hWindow - Handle to the window.
;
;   X, Y, Width, Height - Output variables. [Optional] If defined, these
;       variables contain the coordinates of the window relative to the
;       upper-left corner of the screen (X and Y), and the Width and Height of
;       the window.
;
;   Offset_X, Offset_Y - Output variables. [Optional] Offset, in pixels, of the
;       actual position of the window versus the position of the window as
;       reported by GetWindowRect.  If moving the window to specific
;       coordinates, add these offset values to the appropriate coordinate
;       (X and/or Y) to reflect the true size of the window.
;
; Returns:
;
;   If successful, the address of a RECTPlus structure is returned.  The first
;   16 bytes contains a RECT structure that contains the dimensions of the
;   bounding rectangle of the specified window.  The dimensions are given in
;   screen coordinates that are relative to the upper-left corner of the screen.
;   The next 8 bytes contain the X and Y offsets (4-byte integer for X and
;   4-byte integer for Y).
;
;   Also if successful (and if defined), the output variables (X, Y, Width,
;   Height, Offset_X, and Offset_Y) are updated.  See the *Parameters* section
;   for more more information.
;
;   If not successful, FALSE is returned.
;
; Requirement:
;
;   Windows 2000+
;
; Remarks, Observations, and Changes:
;
; * Starting with Windows Vista, Microsoft includes the Desktop Window Manager
;   (DWM) along with Aero-based themes that use DWM.  Aero themes provide new
;   features like a translucent glass design with subtle window animations.
;   Unfortunately, the DWM doesn't always conform to the OS rules for size and
;   positioning of windows.  If using an Aero theme, many of the windows are
;   actually larger than reported by Windows when using standard commands (Ex:
;   WinGetPos, GetWindowRect, etc.) and because of that, are not positioned
;   correctly when using standard commands (Ex: gui Show, WinMove, etc.).  This
;   function was created to 1) identify the true position and size of all
;   windows regardless of the window attributes, desktop theme, or version of
;   Windows and to 2) identify the appropriate offset that is needed to position
;   the window if the window is a different size than reported.
;
; * The true size, position, and offset of a window cannot be determined until
;   the window has been rendered.  See the example script for an example of how
;   to use this function to position a new window.
;
; * 20150906: The "dwmapi\DwmGetWindowAttribute" function can return odd errors
;   if DWM is not enabled.  One error I've discovered is a return code of
;   0x80070006 with a last error code of 6, i.e. ERROR_INVALID_HANDLE or "The
;   handle is invalid."  To keep the function operational during this types of
;   conditions, the function has been modified to assume that all unexpected
;   return codes mean that DWM is not available and continue to process without
;   it.  When DWM is a possibility (i.e. Vista+), a developer-friendly messsage
;   will be dumped to the debugger when these errors occur.
;
; Credit:
;
;   Idea and some code from *KaFu* (AutoIt forum)
;
; Author:
;
;    jballi
;
; Forum Link:
;
;    https://autohotkey.com/boards/viewtopic.php?t=3392
;-------------------------------------------------------------------------------
WinGetPosEx(hWindow
  ,ByRef X=""
  ,ByRef Y=""
  ,ByRef Width=""
  ,ByRef Height=""
  ,ByRef Offset_X=""
  ,ByRef Offset_Y="") {
  Static Dummy5693
  ,RECTPlus
  ,S_OK:=0x0
      ,DWMWA_EXTENDED_FRAME_BOUNDS:=9

  ;-- Workaround for AutoHotkey Basic
  PtrType:=(A_PtrSize=8) ? "Ptr":"UInt"

  ;-- Get the window's dimensions
  ;   Note: Only the first 16 bytes of the RECTPlus structure are used by the
  ;   DwmGetWindowAttribute and GetWindowRect functions.
  VarSetCapacity(RECTPlus,24,0)
  DWMRC:=DllCall("dwmapi\DwmGetWindowAttribute"
    ,PtrType,hWindow                                ;-- hwnd
    ,"UInt",DWMWA_EXTENDED_FRAME_BOUNDS             ;-- dwAttribute
    ,PtrType,&RECTPlus                              ;-- pvAttribute
    ,"UInt",16)                                     ;-- cbAttribute

  if (DWMRC<>S_OK)
    {
    if ErrorLevel in -3,-4  ;-- Dll or function not found (older than Vista)
    {
      ;-- Do nothing else (for now)
    }
    else
      outputdebug,
        (ltrim join`s
          Function: %A_ThisFunc% -
          Unknown error calling "dwmapi\DwmGetWindowAttribute".
          RC=%DWMRC%,
          ErrorLevel=%ErrorLevel%,
          A_LastError=%A_LastError%.
          "GetWindowRect" used instead.
        )

    ;-- Collect the position and size from "GetWindowRect"
    DllCall("GetWindowRect",PtrType,hWindow,PtrType,&RECTPlus)
    }

  ;-- Populate the output variables
  X:=Left :=NumGet(RECTPlus,0,"Int")
  Y:=Top  :=NumGet(RECTPlus,4,"Int")
  Right   :=NumGet(RECTPlus,8,"Int")
  Bottom  :=NumGet(RECTPlus,12,"Int")
  Width   :=Right-Left
  Height  :=Bottom-Top
  OffSet_X:=0
  OffSet_Y:=0

  ;-- If DWM is not used (older than Vista or DWM not enabled), we're done
  if (DWMRC<>S_OK)
    Return &RECTPlus

  ;-- Collect dimensions via GetWindowRect
  VarSetCapacity(RECT,16,0)
  DllCall("GetWindowRect",PtrType,hWindow,PtrType,&RECT)
  GWR_Width :=NumGet(RECT,8,"Int")-NumGet(RECT,0,"Int")
    ;-- Right minus Left
  GWR_Height:=NumGet(RECT,12,"Int")-NumGet(RECT,4,"Int")
    ;-- Bottom minus Top

  ;-- Calculate offsets and update output variables
  NumPut(Offset_X:=(Width-GWR_Width)//2,RECTPlus,16,"Int")
  NumPut(Offset_Y:=(Height-GWR_Height)//2,RECTPlus,20,"Int")
  Return &RECTPlus
}

/**
 * SnapActiveWindow resizes and moves the active window to a given position.
 * @param {string} winPlaceVertical
 *    The vertical placement of the active window.
 *    Expecting "bottom" or "middle", otherwise assumes "top" placement.
 * @param {string} winPlaceHorizontal
 *    The horizontal placement of the active window.
 *    Expecting "left" or "right", otherwise assumes window should span the
 *    "full" width of the monitor.
 * @param {string} winSizeHeight
 *    The height of the active window in relation to the active monitor's
 *    height. Expecting "half" size, otherwise will resize window to a "third".
 */
 SplitSnapActiveWindow(winPlaceVertical, winPlaceHorizontal, winSizeHeight) {
  oldClipboard = clipboardAll
  clipboard =
  while(clipboard == "") {
    SendInput ^l^c
  }
  SendInput ^w^n
  WinWaitNotActive
  SendInput %clipboard%{enter}
  clipboard := %oldClipboard%
	SnapActiveWindow(winPlaceVertical, winPlaceHorizontal, winSizeHeight)
}

SnapActiveWindow(winPlaceVertical, winPlaceHorizontal, winSizeHeight) {
    heightOffset := 7
    widthOffset := 15
    xOffset := 7
    
    activeWin := WinExist("A")
    activeMon := GetMonitorIndexFromWindow(activeWin)
		WinGet, MinMaxState, MinMax, A
		If (MinMaxState) {
			WinRestore, A
		}
	
    SysGet, MonitorWorkArea, MonitorWorkArea, %activeMon%

    if (winSizeHeight == "half") {
        height := (MonitorWorkAreaBottom - MonitorWorkAreaTop)/2 + heightOffset
    } else if (winSizeHeight == "full") {
        height := (MonitorWorkAreaBottom - MonitorWorkAreaTop) + heightOffset
		} else if (winSizeHeight == "third") {
        height := (MonitorWorkAreaBottom - MonitorWorkAreaTop)/3
    }

    AreaDiff := MonitorWorkAreaRight - MonitorWorkAreaLeft
    if (winPlaceHorizontal == "left") {
        posX  := MonitorWorkAreaLeft - xOffset
        width := (AreaDiff)/2 + widthOffset
    } else if (winPlaceHorizontal == "right") {
        posX  := MonitorWorkAreaLeft + (AreaDiff)/2 - xOffset
        width := (AreaDiff)/2 + widthOffset
    } else {
        posX  := MonitorWorkAreaLeft - xOffset
        width := AreaDiff + widthOffset
    }

    if (winPlaceVertical == "bottom") {
        posY := MonitorWorkAreaBottom - height + heightOffset
    } else if (winPlaceVertical == "middle") {
        posY := MonitorWorkAreaTop + height
    } else {
        posY := MonitorWorkAreaTop
    }
	
    WinMove,A,,%posX%,%posY%,%width%,%height%
}

shrinkActiveWindow(command) {
	WinGet activeWin, ID, A
	activeMon := GetMonitorIndexFromWindow(activeWin)

	SysGet, MonitorWorkArea, MonitorWorkArea, %activeMon%
	WinGetPos, posX, posY, width, height, A

	if (command == "halfbottom") {
		height := height/2
		posY := posY + height
	}
   if (command == "halftop") {
      height := height/2
   }
   if (command == "halfright") {
      width := width/2
		posX := posX + width
	}
   if (command == "halfleft") {
      width := width/2
   }
   if (command == "halftopleft") {
      height := height/2
      width := width/2
   }
   if (command == "halftopright") {
      height := height/2
      width /= 2
		posX := posX + width
   }

   WinMove,A,,%posX%,%posY%,%width%,%height%
}

; TODO: These aren't needed?
max(x,y) {
    return x > y ? x : y
}

min(x,y) {
    return x < y ? x : y
}

activateWindow(num) {
	WinGet activeWin, ID, A
	activeMon := GetMonitorIndexFromWindow(activeWin)
	SysGet, MonitorWorkArea, MonitorWorkArea, %activeMon%
	CoordMode, Mouse, Screen
	Switch num {
		Case 7:
			MouseMove MonitorWorkAreaRight / 4, MonitorWorkAreaBottom / 4, 0
		Case 8:
			MouseMove MonitorWorkAreaRight / 2, MonitorWorkAreaBottom / 4, 0
		Case 9:
			MouseMove 3 * MonitorWorkAreaRight / 4, MonitorWorkAreaBottom / 4, 0
		Case 4:
			MouseMove MonitorWorkAreaRight / 4, MonitorWorkAreaBottom / 2, 0
		Case 6:
			MouseMove 3 * MonitorWorkAreaRight / 4, MonitorWorkAreaBottom / 2, 0
		Case 1:
			MouseMove MonitorWorkAreaRight / 4, 3 * MonitorWorkAreaBottom / 4, 0
		Case 2:
			MouseMove MonitorWorkAreaRight / 2, 3 * MonitorWorkAreaBottom / 4, 0
		Case 3:
			MouseMove 3 * MonitorWorkAreaRight / 4, 3 * MonitorWorkAreaBottom / 4, 0
	}
	Sleep, 100
	MouseGetPos,,, hwnd 
	WinActivate, ahk_id %hwnd%
}

moveActiveWindow(command) {
    WinGet activeWin, ID, A
    activeMon := GetMonitorIndexFromWindow(activeWin)

    SysGet, MonitorWorkArea, MonitorWorkArea, %activeMon%
	 WinGetPos, posX, posY, width, height, A

   if (command == "moveup" || command == "moveupright" || command == "moveupleft") && (posY - height >= 0) {
		  posY := posY - height
	}
   if (command == "movedown" || command = "movedownright" || command = "movedownleft") && (posY + height * 2 <= MonitorWorkAreaBottom) {
		  posY := posY + height
	}
   if (command == "moveright" || command == "moveupright" || command == "movedownright") && (posX + width * 2 <= MonitorWorkAreaRight) {
		  posX := posX + width
	}
	if (command == "moveleft" || commmand == "moveupleft" || command == "movedownleft") && (posX - height >= 0) {
		  posX := posX - width
	}

    WinMove,A,,%posX%,%posY%,%width%,%height%
}
