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
import time

from talon import Module, app

mod = Module()

_cg = ctypes.CDLL(ctypes.util.find_library("CoreGraphics"))

_cg.CGEventSourceCreate.restype = ctypes.c_void_p
_cg.CGEventSourceCreate.argtypes = [ctypes.c_int32]

_cg.CGEventCreateKeyboardEvent.restype = ctypes.c_void_p
_cg.CGEventCreateKeyboardEvent.argtypes = [ctypes.c_void_p, ctypes.c_uint16, ctypes.c_bool]

_cg.CGEventSetFlags.argtypes = [ctypes.c_void_p, ctypes.c_uint64]

_cg.CGEventPost.argtypes = [ctypes.c_uint32, ctypes.c_void_p]

_cg.CFRelease.argtypes = [ctypes.c_void_p]


class _CGPoint(ctypes.Structure):
    _fields_ = [("x", ctypes.c_double), ("y", ctypes.c_double)]


_cg.CGEventCreate.restype = ctypes.c_void_p
_cg.CGEventCreate.argtypes = [ctypes.c_void_p]

_cg.CGEventGetLocation.restype = _CGPoint
_cg.CGEventGetLocation.argtypes = [ctypes.c_void_p]

_cg.CGEventCreateMouseEvent.restype = ctypes.c_void_p
_cg.CGEventCreateMouseEvent.argtypes = [ctypes.c_void_p, ctypes.c_uint32, _CGPoint, ctypes.c_uint32]

_cg.CGWarpMouseCursorPosition.argtypes = [_CGPoint]

_K_CG_EVENT_SOURCE_STATE_HID_SYSTEM_STATE = 1
_K_CG_HID_EVENT_TAP = 0
_K_CG_EVENT_FLAG_MASK_SHIFT = 0x20000
_K_CG_EVENT_FLAG_MASK_COMMAND = 0x100000
_K_CG_EVENT_LEFT_MOUSE_DOWN = 1
_K_CG_EVENT_LEFT_MOUSE_UP = 2
_K_CG_EVENT_LEFT_MOUSE_DRAGGED = 6
_K_CG_MOUSE_BUTTON_LEFT = 0

# macOS virtual keycodes for standard US ANSI QWERTY, keyed by the unshifted
# character each physical key produces. Shifted symbols (e.g. "!") reuse the
# same keycode as their unshifted key (e.g. "1") with the shift flag set —
# see _keycode_for_char. Letters aren't listed here; they're derived from
# a-z directly since upper/lower share a keycode too.
_BASE_CHAR_KEYCODES = {
    "a": 0x00, "b": 0x0B, "c": 0x08, "d": 0x02, "e": 0x0E, "f": 0x03,
    "g": 0x05, "h": 0x04, "i": 0x22, "j": 0x26, "k": 0x28, "l": 0x25,
    "m": 0x2E, "n": 0x2D, "o": 0x1F, "p": 0x23, "q": 0x0C, "r": 0x0F,
    "s": 0x01, "t": 0x11, "u": 0x20, "v": 0x09, "w": 0x0D, "x": 0x07,
    "y": 0x10, "z": 0x06,
    "0": 0x1D, "1": 0x12, "2": 0x13, "3": 0x14, "4": 0x15,
    "5": 0x17, "6": 0x16, "7": 0x1A, "8": 0x1C, "9": 0x19,
    " ": 0x31, "-": 0x1B, "=": 0x18, "[": 0x21, "]": 0x1E, "\\": 0x2A,
    ";": 0x29, "'": 0x27, ",": 0x2B, ".": 0x2F, "/": 0x2C, "`": 0x32,
}

# Shifted symbol -> the unshifted character on the same physical key.
_SHIFTED_CHARS = {
    "!": "1", "@": "2", "#": "3", "$": "4", "%": "5", "^": "6",
    "&": "7", "*": "8", "(": "9", ")": "0", "_": "-", "+": "=",
    "{": "[", "}": "]", "|": "\\", ":": ";", '"': "'",
    "<": ",", ">": ".", "?": "/", "~": "`",
}


def _keycode_for_char(ch: str) -> tuple[int, bool] | None:
    """Returns (keycode, needs_shift), or None if the character can't be typed."""
    if ch.isupper() and ch.lower() in _BASE_CHAR_KEYCODES:
        return _BASE_CHAR_KEYCODES[ch.lower()], True
    if ch in _BASE_CHAR_KEYCODES:
        return _BASE_CHAR_KEYCODES[ch], False
    if ch in _SHIFTED_CHARS:
        return _BASE_CHAR_KEYCODES[_SHIFTED_CHARS[ch]], True
    return None

# macOS virtual keycodes (kVK_* from Carbon/HIToolbox), not ASCII/Unicode.
# Values are (keycode, modifier flags); flags is 0 for a plain key press.
KEYCODES = {
    "UP": (0x7E, 0),
    "DOWN": (0x7D, 0),
    "LEFT": (0x7B, 0),
    "RIGHT": (0x7C, 0),
    "RETURN": (0x24, 0),
    "ENTER": (0x24, 0),
    "DELETE": (0x33, 0),  # backspace
    "FORWARD_DELETE": (0x75, 0),
    "TAB": (0x30, 0),
    "SPACE": (0x31, 0),
    "ESCAPE": (0x35, 0),
    "PAGE_UP": (0x74, 0),
    "PAGE_DOWN": (0x79, 0),
    # Android Emulator hotkeys — bound to Justin's actual confirmed shortcuts
    # (Android Studio's defaults vary by version, so these match what's
    # verified working on the physical keyboard, not an assumed default).
    "HOME": (0x04, _K_CG_EVENT_FLAG_MASK_COMMAND | _K_CG_EVENT_FLAG_MASK_SHIFT),  # Cmd+Shift+H
    "ROTATE_LEFT": (0x7B, _K_CG_EVENT_FLAG_MASK_COMMAND),  # Cmd+Left
    "ROTATE_RIGHT": (0x7C, _K_CG_EVENT_FLAG_MASK_COMMAND),  # Cmd+Right
}


def _hid_source():
    return _cg.CGEventSourceCreate(_K_CG_EVENT_SOURCE_STATE_HID_SYSTEM_STATE)


def _post_keycode(keycode: int, flags: int = 0) -> None:
    source = _hid_source()
    for key_down in (True, False):
        event = _cg.CGEventCreateKeyboardEvent(source, keycode, key_down)
        if flags:
            _cg.CGEventSetFlags(event, flags)
        _cg.CGEventPost(_K_CG_HID_EVENT_TAP, event)
        _cg.CFRelease(event)
    _cg.CFRelease(source)


def _post_char(ch: str) -> bool:
    hit = _keycode_for_char(ch)
    if hit is None:
        return False
    keycode, needs_shift = hit

    source = _hid_source()
    for key_down in (True, False):
        event = _cg.CGEventCreateKeyboardEvent(source, keycode, key_down)
        if needs_shift:
            _cg.CGEventSetFlags(event, _K_CG_EVENT_FLAG_MASK_SHIFT)
        _cg.CGEventPost(_K_CG_HID_EVENT_TAP, event)
        _cg.CFRelease(event)
    _cg.CFRelease(source)
    return True


def _post_text(text: str) -> None:
    # A real hardware keyboard sends one key at a time — CGEventKeyboardSetUnicodeString
    # (attaching a whole string to a single event) only works when the receiving
    # app reads that attachment via its own text-input system. DeviceHub instead
    # forwards events by their raw virtual keycode, as a genuine hardware-passthrough
    # target would, so each character needs its own real keydown/keyup pair.
    skipped = [ch for ch in text if not _post_char(ch)]
    if skipped:
        app.notify("hid_type_text: couldn't type these characters", "".join(skipped))


def _post_mouse(source, event_type: int, x: float, y: float) -> None:
    event = _cg.CGEventCreateMouseEvent(source, event_type, _CGPoint(x, y), _K_CG_MOUSE_BUTTON_LEFT)
    _cg.CGEventPost(_K_CG_HID_EVENT_TAP, event)
    _cg.CFRelease(event)


def _drag_vertical(dy: float, steps: int = 12, step_delay: float = 0.012) -> None:
    # The Android Emulator ignores scroll-wheel and trackpad scroll events but
    # does turn a mouse drag into a touch swipe, so "scrolling" here means
    # dragging from the pointer's current position and then putting it back.
    probe = _cg.CGEventCreate(None)
    start = _cg.CGEventGetLocation(probe)
    _cg.CFRelease(probe)

    source = _hid_source()
    _post_mouse(source, _K_CG_EVENT_LEFT_MOUSE_DOWN, start.x, start.y)
    time.sleep(step_delay)
    for i in range(1, steps + 1):
        _post_mouse(source, _K_CG_EVENT_LEFT_MOUSE_DRAGGED, start.x, start.y + dy * i / steps)
        time.sleep(step_delay)
    # Holding still briefly before release stops Android treating the swipe as
    # a fling, so each command scrolls a predictable distance.
    time.sleep(0.08)
    _post_mouse(source, _K_CG_EVENT_LEFT_MOUSE_UP, start.x, start.y + dy)
    _cg.CFRelease(source)
    _cg.CGWarpMouseCursorPosition(start)


@mod.action_class
class Actions:
    def hid_key(name: str):
        """Posts a hardware-tagged key press or key combo, by name (see KEYCODES)"""
        hit = KEYCODES.get(name.upper())
        if hit is None:
            app.notify("hid_key: unknown key", name)
            return
        keycode, flags = hit
        _post_keycode(keycode, flags)

    def hid_type_text(text: str):
        """Posts hardware-tagged text as a real key press per character (US QWERTY layout)"""
        if text:
            _post_text(text)

    def hid_drag_scroll(direction: str, distance: int = 300):
        """Scrolls the Android Emulator by dragging from the mouse pointer (UP or DOWN, distance in points)"""
        # Touch scrolling is inverted relative to the drag: to scroll down, the
        # finger moves up the screen.
        sign = {"UP": 1, "DOWN": -1}.get(direction.upper())
        if sign is None:
            app.notify("hid_drag_scroll: unknown direction", direction)
            return
        _drag_vertical(sign * distance)
