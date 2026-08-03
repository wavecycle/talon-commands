# Requires https://plugins.jetbrains.com/plugin/10504-voice-code-idea
# Uses Talon Community repo, calls functions in jetbrains.py

os: windows
os: linux
app: jetbrains
app: Android Studio
-

# user.idea("action ")
# this is useful if an app seems to jumble or drop user.idea("action ")
settings():
    user.idea("action ")

# template words: shift ctrl alt

stop [it]: key(ctrl-f2)
[android] settings: key(ctrl-alt-s)
[search] (file|files): key(ctrl-shift-f)

[info] suggestion: key(shift-alt-enter)
[android] help: key(ctrl-q)
duplicate [line]: key(ctrl-d)

view (right|next): key(alt-shift-right)
view (left|last): key(alt-shift-left)
view refresh: key(ctrl-shift-f5)
matching [bracket]: key(ctrl-shift-m)
regex: key(alt-x)

# MUST ASSIGN IN: ANDROID STUDIO > SETTINGS > KEYMAPS
clear logcat: key(ctrl-alt-1)
open [in] terminal: key(ctrl-alt-2)
open [in] (explorer|finder): key(ctrl-alt-3)