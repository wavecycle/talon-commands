# Same commands as native_hid_droid.talon, scoped to a standalone
# "Device Hub" window instead of an embedded Android Studio tool window —
# see that file for the full explanation.

os: mac
app: Device Hub
-

droid type <user.text>:
    user.hid_type_text(user.text)

droid enter: user.hid_key("RETURN")
droid delete: user.hid_key("DELETE")
droid forward delete: user.hid_key("FORWARD_DELETE")
droid tab: user.hid_key("TAB")
droid space: user.hid_key("SPACE")
droid escape: user.hid_key("ESCAPE")
droid up: user.hid_key("UP")
droid down: user.hid_key("DOWN")
droid left: user.hid_key("LEFT")
droid right: user.hid_key("RIGHT")
