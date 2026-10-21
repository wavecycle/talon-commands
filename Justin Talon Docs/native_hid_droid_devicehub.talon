# Same commands as native_hid_robot.talon, scoped to a standalone
# "Device Hub" window instead of an embedded Android Studio tool window —
# see that file for the full explanation.

os: mac
app: Device Hub
-

(robot) type <user.text>:
    user.hid_type_text(user.text)

robot enter: user.hid_key("RETURN")
robot delete: user.hid_key("DELETE")
robot forward delete: user.hid_key("FORWARD_DELETE")
robot tab: user.hid_key("TAB")
robot space: user.hid_key("SPACE")
robot escape: user.hid_key("ESCAPE")
(robot|go) up: user.hid_key("UP")
(robot|go) down: user.hid_key("DOWN")
(robot|go) left: user.hid_key("LEFT")
(robot|go) right: user.hid_key("RIGHT")

robot home: user.hid_key("HOME")
(robot) rotate left: user.hid_key("ROTATE_LEFT")
(robot) rotate right: user.hid_key("ROTATE_RIGHT")
