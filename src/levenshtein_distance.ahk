; LevenshteinDistance.ahk
;
; Based on a post by nnik
; Source: https://www.autohotkey.com/boards/viewtopic.php?f=6&t=39112
;
; Source Wikipedia.com
; - "Informally, the Levenshtein distance between two words is the minimum
;    number of single-character edits (insertions, deletions or substitutions)
;    required to change one word into the other."
; https://en.wikipedia.org/wiki/Levenshtein_distance
; Originally written in C translated into AutoHotkey
;

LevenshteinDistance(s, t)
{
  ; degenerate cases
  if (StrLen( s ) = 0)
    return StrLen( t )
  if ( StrLen( t ) = 0)
    return StrLen( s )

  s := StrSplit( s )
  t := StrSplit( t )

  v0 := []
  Loop % t.Length() + 1
    v0[ A_Index ] := A_Index - 1

  v3 := [v0]
  Loop % s.Length()
  {
    ; calculate v1 (current row distances) from the previous row v0
    i := A_Index
    v1 := [i]
    ; use formula to fill in the rest of the row
    Loop % t.Length()
    {
      cost := !( s[ i ] == t[ A_Index ] )
      v1[ A_Index + 1 ] := _lMin( v1[ A_Index ] + 1
      , v0[ A_Index + 1 ] + 1
      , v0[ A_Index ] + cost )
    }
    v3.Push( v0 )
    v0 := v1
  }

  return v1[ t.Length() +1 ]
}

_lMin( p* )
{
  Ret := p.Pop()
  For each,Val in p
    if ( Val < Ret )
    {
      Ret := Val
    }
  return Ret
}
