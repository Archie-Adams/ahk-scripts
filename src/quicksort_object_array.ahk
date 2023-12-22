; Based on code examples by jeeswg.
; https://www.autohotkey.com/boards/viewtopic.php?t=64447

palette_quicksortObjectArray(ByRef arr, sortByKey) {
  ; Count the number of items to sort.
  ; Create a 'completed' array with that many items.
  ; Each time an item is confirmed as being in the correct place, mark the
  ; appropriate item in the 'completed' array as true.
  oDone := []
  Loop, % arr.Length()
    oDone.Push(0)
  oDone.Push(1)

  vLen := arr.Length()

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
        vPivot := arr[vPosPivot]
        _swapObjectKeys(arr, vPosPivot, vPos2)
        vPosL := vPos1, vPosR := vPos2-1
        Loop
        {
          while (arr[vPosL][sortByKey] < vPivot[sortByKey])
            vPosL++
          while (arr[vPosR][sortByKey] >= vPivot[sortByKey])
            vPosR--
          if (vPosL > vPosR)
            break
          _swapObjectKeys(arr, vPosL, vPosR)
          vPosL++, vPosR--
        }
        _swapObjectKeys(arr, vPos2, vPosL)
        oDone[vPosL] := 1
        vPos1 := vPos2 := 0
      }
    }
  }
}

_swapObjectKeys(ByRef oArray, vKey1, vKey2)
{
  if (vKey1 = vKey2)
    return
  vTemp := oArray[vKey1]
  oArray[vKey1] := oArray[vKey2]
  oArray[vKey2] := vTemp
}
