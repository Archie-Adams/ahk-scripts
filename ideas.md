## Ideas from paper

Already detailed in source but the idea is that when loding commands like
this you wont need to track order, only that they are unbroken chain.
|DESC
|PARAM 

add |PARAM commands which use the palette to take string parameter(s)

ChatGPT command?

'$' command for being a calculator.
|-------------------------------------|
| > $                                 |
|-------------------------------------|
goes to
|-------------------------------------|
| $ |                                 |
|-------------------------------------|
Where you can type calculations
|-------------------------------------|
| $ 8*2                               |
|-------------------------------------|
| 12                                  |
| Press enter to copy to clipboard    |
|-------------------------------------|

Could have an extended version which keeps answers in the list,
can use ans keyword for last calculated result and can move up and down results
to copy or view previous results again.


help doc feat kbsmm

Generically inserting html into the list not just helpfiles?
Could potentially be other neutron projects?

HELP/DESC Docs (MVP1)
show description under focused command

HELP/DESC Docs (MVP2)
when user types '?' it's a special character that turns on 'help mode'
|-------------------------------------|
| > ?                                 |
|-------------------------------------|
|                                     |
|                                     |
|                                     |
                ...
|-------------------------------------|

becomes: with each module being an option.
|-------------------------------------|
| ? Select Module Help                |
|-------------------------------------|
| programs                            |
| websites                            |
| system                              |
| folders                             |
                ...
|-------------------------------------|

Then, one can be selected. Using the descriptions, hotkeys and names a list
of all the modules commands and hotkeys and descriptions will be shown in the
list area.

HELP/DESC Docs (MVP3)
Intergrate kbsmm into the help files so keyboard layout 'images' can be shown.
This could start out by being a default numpad layout - but could have a config
option in the json. This would probably requrie an offshoot of kbsmm that can
take a list of hotkeys and names and generate a static keyboard image.
This could then be extended to have an 'All Commands' help section that has
all the modules hotkeys, in unique colours on the same keyboards.

