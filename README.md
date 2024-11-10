# TerminalSummon
AutoHotKey script to show a terminal window with a keypress

# Details
The key that summons the terminal can be set by modifying line 4 (SC056). 

# Recommended Settings
It is highly recommended that you set your windows terminal to always-on-top

# Secret Functions
The Scripts contains a secret function called Explorer. To use it, uncomment lines 6-9
The function allows the terminal window to automatically set it's working directory to the directory open in the explorer window, if an explorer window is active.
Warning: the function is a bodge. It is highly experimental and unstable, I don't recommend using it. It also requires a powershell method called Clean-Lines to be defined, which hides the extra lines from changing the working directory, the original file of which has been lost,
although it shouldn't be hard to recreate.
This can be removed by commenting out lines 26-36.

# Why is this so complex?
Because I made the script for my personal use
