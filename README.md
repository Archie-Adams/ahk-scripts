# Ahk-Scripts

This project includes:
- Boilerplate templates to run any program with global hotkeys, with many common programs added already.
- Window snapping functionality in thirds and 9x9 grid.
- Templates for application specific hotkeys.
- Templates for using <kbd>CAPS</kbd> as a modifier.
- Script templates and chrome extension to use AHK to control Google Chrome with Javascript.
- Website tool to create visual graphics & help files of keyboard shortcuts. [(Also found online here)](https://github.com/Archie-Adams/keyboard-shortcut-map-maker)
- Template for a 'FastNav' GUI based shortcut window for executing many actions quickly without having to remember/take up many shortcuts.
- Many utility expansions scripts including; math symbols, ascii art, german-umlauts, and autocorrect for common typos.
- Main script file which combines all other files for easy expandability.  

All scripts are designed to be modular and independent - so any .ahk file can
be taken and used on its own.  
If you publicly release any of these files please link to or credit to this
repository.  


# Main features / ideas

- <kbd>CAPS</kbd> key will become a modifier key, with functions changing
depending on the currently focused program or tab.  
- <kbd>RightShift</kbd>, <kbd>RightCtrl</kbd> and <kbd>RightAlt</kbd> keys will
sometimes be used independently of their left-side counterparts much like the
caps key to offer program scope shortcuts where more are needed.  
- All global level shortcuts will use the <kbd>WIN</kbd> key.  
- There will be help files that can be accessed with <kbd>RAlt + /</kbd>, or
<kbd>WIN + RAlt + /</kbd> for global shortcuts.  
  - These will be created using [this website project](https://github.com/Archie-Adams/keyboard-shortcut-map-maker) I made for this purpose.  
  - The keyboard shortcut to open them toggles them off as well.  
  - Each window/website will have its own help file.  


# Installation
1) Clone this repo to anywhere on the system.
2) Create a shortcut to `...\src\ahk-scripts.ahk` in the start up folder.

# Contribution

Contribution to this project is welcome, be it to add an existing script you
think would be useful, or if you want to improve on one already here.  

Any feature requests and bug reports are also welcome and I will try my best to
maintain this project, but please understand this is a side project for personal use.  


# Acknowledgements
- (https://www.autohotkey.com/download/AutoCorrect.ahk)[https://www.autohotkey.com/download/AutoCorrect.ahk]
- (Andrew Moore (AdvancedWindowSnap))[https://gist.github.com/AWMooreCO/1ef708055a11862ca9dc]


&nbsp;

<!-- SCRIPT COPY -->

----
(The following is automatically generated from the src directory by 
[build-readme.py](build-readme.py).)  

----
# Documentation for all scripts

Links to all documentation markdown files in the project.

---

<!-- SCRIPT STOP -->

---
## expansions
[ascii.md](src/expansions/ascii.md)  
[autocorrect.md](src/expansions/autocorrect.md)  
[german-umlauts.md](src/expansions/german-umlauts.md)  
[math-expansions.md](src/expansions/math-expansions.md)  

---
## global
[AdvancedWindowSnap.md](src/global/AdvancedWindowSnap.md)  

---
## programs
[chrome.md](src/programs/chrome/chrome.md)  
