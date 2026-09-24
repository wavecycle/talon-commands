# Posts genuinely hardware-tagged key events (see native_hid_key.py) instead
# of Talon's default synthetic key(), which the Android Emulator's and
# DeviceHub's hardware-keyboard-passthrough mode silently ignores.
#
# Covers the embedded case, where the emulator/simulator panel is a tool
# window inside Android Studio and Talon's ui.active_app() still reports
# "Android Studio" as frontmost. See native_hid_droid_devicehub.talon for the
# standalone DeviceHub.app window case — kept separate since Talon flags the
# same phrase defined twice in one file as a duplicate, even under different
# context blocks.

# os: mac
# app: Android Studio
# -

# droid type <user.text>:
    # user.hid_type_text(user.text)

# droid enter: user.hid_key("RETURN")
# droid delete: user.hid_key("DELETE")
# droid forward delete: user.hid_key("FORWARD_DELETE")
# droid tab: user.hid_key("TAB")
# droid space: user.hid_key("SPACE")
# droid escape: user.hid_key("ESCAPE")
# droid up: user.hid_key("UP")
# droid down: user.hid_key("DOWN")
# droid left: user.hid_key("LEFT")
# droid right: user.hid_key("RIGHT")
