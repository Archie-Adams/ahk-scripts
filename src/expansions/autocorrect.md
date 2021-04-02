# autocorrect.ahk

Contains expansions that correct common misspellings and typos.  
Available from: https://www.autohotkey.com/download/AutoCorrect.ahk

------------------------------------------------------------------------------
 
This is an AutoHotKey script that implements AutoCorrect against several
"Lists of common misspellings":

This does not replace a proper spellchecker such as in Firefox, Word, etc.
It is usually better to have uncertain typos highlighted by a spellchecker
than to "correct" them incorrectly so that they are no longer even caught by
a spellchecker: it is not the job of an autocorrector to correct *all*
misspellings, but only those which are very obviously incorrect.

From a suggestion by Tara Gibb, you can add your own corrections to any
highlighted word by hitting Win+H. These will be added to a separate file,
so that you can safely update this file without overwriting your changes.

Some entries have more than one possible resolution (achive->achieve/archive)
or are clearly a matter of deliberate personal writing style (wanna, colour)

These have been placed at the end of this file and commented out, so you can
easily edit and add them back in as you like, tailored to your preferences.

## SOURCES

http://en.wikipedia.org/wiki/Wikipedia:Lists_of_common_misspellings  
http://en.wikipedia.org/wiki/Wikipedia:Typo  
Microsoft Office autocorrect list  
Script by jaco0646 http://www.autohotkey.com/forum/topic8057.html  
OpenOffice autocorrect list  
TextTrust press release  
User suggestions.  

## CONTENTS

  Settings  
  AUto-COrrect TWo COnsecutive CApitals (commented out by default)  
  Win+H code  
  Fix for -ign instead of -ing  
  Word endings  
  Word beginnings  
  Accented English words  
  Common Misspellings - the main list  
  Ambiguous entries - commented out  