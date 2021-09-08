# ---------------------------------------------------------------------------- #
#                                   build.py                                   #
# ---------------------------------------------------------------------------- #
#                             Author: Archie Adams                             #
# ---------------------------------------------------------------------------- #
#       Script to combine all .ahk files in ./src into one file in build.      #
# ---------------------------------------------------------------------------- #

# TODO: Implement build.py

# Arg 0 to specify filename, null defaults to out.ahk

# Combine all ahk source files into one file, then run ahkToExe command.

# Have the build file be called out-date/time
# Have -c tag to auto run ahk compiler.
# Have -o tag to specify file name.
# Have error if file exists.
# Have -d tag to specify a directory or list of directories to compile from,
# and only use those
# By default compile everything under the src folder in the same dir as
# build.py
# Have an option in the build dir mode to specify not include help files.
