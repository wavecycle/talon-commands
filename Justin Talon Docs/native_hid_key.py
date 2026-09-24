"""
Posts genuinely hardware-tagged keyboard events via raw CoreGraphics calls,
instead of Talon's default synthetic-key path.

macOS tags every CGEvent with a CGEventSourceStateID: real hardware key
presses carry kCGEventSourceStateHIDSystemState (1); most software-injected
events (including, apparently, Talon's default key() action) carry
kCGEventSourceStateCombinedSessionState (0) instead. Apps that read raw HID
keyboard input — like the Android Emulator's and Xcode's DeviceHub's
hardware-keyboard-passthrough mode — only listen for the former, so
CombinedSessionState-tagged synthetic events are silently ignored even
though a normal window would treat them identically to a real key press.

Creating the CGEventSource explicitly as HIDSystemState and posting at
kCGHIDEventTap (the lowest-level tap, closest to the actual injection point)
produces events verified (via CGEventSourceGetSourceStateID) to carry the
same state ID as genuine hardware — see the accompanying investigation.
"""

import ctypes
import ctypes.util

from talon import Module, app

mod = Module()

_cg = ctypes.CDLL(ctypes.util.find_library("CoreGraphics"))

_cg.CGEventSourceCreate.restype = ctypes.c_void_p
_cg.CGEventSourceCreate.argtypes = [ctypes.c_int32]

_cg.CGEventCreateKeyboardEvent.restype = ctypes.c_void_p
_cg.CGEventCreateKeyboardEvent.argtypes = [ctypes.c_void_p, ctypes.c_uint16, ctypes.c_bool]

_cg.CGEventSetFlags.argtypes = [ctypes.c_void_p, ctypes.c_uint64]

_cg.CGEventKeyboardSetUnicodeString.argtypes = [
    ctypes.c_void_p,
    ctypes.c_uint32,
    ctypes.POINTER(ctypes.c_uint16),
]

_cg.CGEventPost.argtypes = [ctypes.c_uint32, ctypes.c_void_p]

_cg.CFRelease.argtypes = [ctypes.c_void_p]

_K_CG_EVENT_SOURCE_STATE_HID_SYSTEM_STATE = 1
_K_CG_HID_EVENT_TAP = 0

# macOS virtual keycodes (kVK_* from Carbon/HIToolbox), not ASCII/Unicode.
KEYCODES = {
    "UP": 0x7E,
    "DOWN": 0x7D,
    "LEFT": 0x7B,
    "RIGHT": 0x7C,
    "RETURN": 0x24,
    "ENTER": 0x24,
    "DELETE": 0x33,  # backspace
    "FORWARD_DELETE": 0x75,
    "TAB": 0x30,
    "SPACE": 0x31,
    "ESCAPE": 0x35,
}


def _hid_source():
    return _cg.CGEventSourceCreate(_K_CG_EVENT_SOURCE_STATE_HID_SYSTEM_STATE)


def _post_keycode(keycode: int) -> None:
    source = _hid_source()
    for key_down in (True, False):
        event = _cg.CGEventCreateKeyboardEvent(source, keycode, key_down)
        _cg.CGEventPost(_K_CG_HID_EVENT_TAP, event)
        _cg.CFRelease(event)
    _cg.CFRelease(source)


def _post_unicode_text(text: str) -> None:
    utf16 = text.encode("utf-16-le")
    length = len(utf16) // 2
    buf = (ctypes.c_uint16 * length).from_buffer_copy(utf16)

    source = _hid_source()
    for key_down in (True, False):
        # Keycode 0 with an attached Unicode string is the standard way to
        # post arbitrary text without mapping every character to a physical
        # key + modifier combination.
        event = _cg.CGEventCreateKeyboardEvent(source, 0, key_down)
        _cg.CGEventKeyboardSetUnicodeString(event, length, buf)
        _cg.CGEventPost(_K_CG_HID_EVENT_TAP, event)
        _cg.CFRelease(event)
    _cg.CFRelease(source)


@mod.action_class
class Actions:
    def hid_key(name: str):
        """Posts a hardware-tagged key press (UP, DOWN, LEFT, RIGHT, RETURN, DELETE, FORWARD_DELETE, TAB, SPACE, ESCAPE)"""
        keycode = KEYCODES.get(name.upper())
        if keycode is None:
            app.notify("hid_key: unknown key", name)
            return
        _post_keycode(keycode)

    def hid_type_text(text: str):
        """Posts hardware-tagged Unicode text, one character at a time is not required — the whole string goes in one event"""
        if text:
            _post_unicode_text(text)
