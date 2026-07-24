# Requires https://plugins.jetbrains.com/plugin/10504-voice-code-idea
# Uses Talon Community repo, calls functions in jetbrains.py

app: jetbrains
os: mac
app: Android Studio

-

# user.idea("action ")
# this is useful if an app seems to jumble or drop user.idea("action ")
settings():
    user.idea("action ")

# template words: shift ctrl alt

stop [it]: key(cmd-f2)
[android] settings: key(cmd-,)
[info] suggestion: key(shift-alt-enter)
android help: key(f1)
duplicate [line]: key(cmd-d)
# keymap restore: user.idea("action Keymap.Restore")
