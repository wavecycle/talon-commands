# Requires https://plugins.jetbrains.com/plugin/10504-voice-code-idea
app.name: Android Studio
app.name: IntelliJ IDEA
-

# key_wait increases the delay when pressing keys (milliseconds)
# this is useful if an app seems to jumble or drop keys
settings():
    key_wait = 8.0

# template words: shift ctrl alt

# IDE voice commands
android settings: key(ctrl-alt-s)
project structure: key(ctrl-alt-shift-s)
zen mode: key(ctrl-alt-shift-z)
[android] info:	key(alt-enter)
[android] help:	key(ctrl-q)
[android] search: key(ctrl-shift-a)
[search] everywhere: key(ctrl-alt-shift-f9)
[search] file: key(ctrl-alt-shift-f10)

duplicate [line]: key(ctrl-d)
android case: key(ctrl-shift-u)

menu file: key(alt-f)
menu edit: key(alt-e)
menu view: key(alt-v)
menu navigate: key(alt-n)
menu code: key(alt-c)
menu analyze: key(alt-z)
menu refactor: key(alt-r)
menu build:	key(alt-b)
menu run: key(alt-u)
menu tools: key(alt-t)
menu window: key(alt-w)
menu help: key(alt-h)

panel project: key(alt-1)
panel favorites: key(alt-2)
panel find:	key(alt-3)
panel run: key(alt-4)
panel debug: key(alt-5)
panel problems:	key(alt-6)
panel structure: key(alt-7)
panel git: key(alt-9)
panel commit: key(alt-0)
panel logcat: key(alt-f11)
panel terminal: key(alt-f12)
panel resource [manager]:   key(ctrl-alt-shift-f1)
panel inspection:           key(ctrl-alt-shift-f11)
panel device:               key(ctrl-alt-shift-f12)

view left:				key(alt-shift-left)			
view right:				key(alt-shift-right)
[build] refresh:        key(ctrl-shift-f5)
code left:				key(alt-left)
code right:				key(alt-right)
code close:				key(ctrl-f4)
code reformat:			key(ctrl-alt-l)
block up:				key(alt-up)
block down:				key(alt-down)
block jump:				key(ctrl-shift-m)
comment line:			key(ctrl-/)
comment block:			key(ctrl-shift-slash)
android select:			key(ctrl-w)
fold close:				key(ctrl-minus)
fold open:				key(ctrl-=)
fold all:				key(ctrl-shift-=)

refactor rename:		key(shift-f6)
refactor function:		key(ctrl-alt-m)
refactor options:		key(ctrl-shift-alt-t)

[android] override:		key(ctrl-o)
[android] implement:	key(ctrl-i)
[android] generate:		key(alt-insert)
[android] construct:	key(ctrl-shift-enter)
[android] members:		key(ctrl-f12)
[android] block:		key(ctrl-alt-t)
# [android] undo:			key(ctrl-z)
# [android] redo:			key(ctrl-shift-z)

[android] menu:			key(ctrl-space)
[android] hierarchy:	key(ctrl-h)
[android] usage:		key(ctrl-b)	

[android] run:			key(alt-shift-f10)
test run:				key(ctrl-shift-f10)
[android] apply:		key(ctrl-f10)
[android] debug:		key(alt-shift-f9)
[android] resume:		key(f9)
[android] stop:			key(ctrl-f2)
[android] evaluate:		key(alt-f8)
step into:				key(f7)
step over:				key(f8)
step cursor:			key(alt-f9)
breakpoint toggle:		key(ctrl-f8)
[android] watch:		key(alt-[)
warning next:			key(f2)
warning previous:		key(shift-f2)

# compound commands
line number <digits>:
    key(ctrl-g)
    key(delete)
    insert(digits)
    # key(enter)

# Data types
# string: 'String'
# integer: 'Int'
# long: 'Long'
# float: 'Float'
# double: 'Double'
# list:
#     'List'
#     key(<)


android tag:				
    'private const val TAG = ""'
    key(left:1)
android invoke:			
    'suspend operator fun invoke()'
    key(left:1)
log verbose:				
    'Log.v(TAG, "")'
    key(left:2)
log debug:				
    'Log.d(TAG, "")'
    key(left:2)
log info:
    'Log.i(TAG, "")'
    key(left:2)
log warning:				
    'Log.w(TAG, "")'
    key(left:2)
log error:				
    'Log.e(TAG, "")'
    key(left:2)
            
throw exception:			
    "throw Exception()"
    key(left:2)
throw state:				
    "throw IllegalStateException()"
    key(left:2)
throw argument:			
    "throw IllegalArgumentException()"
    key(left:2)
throw null:				
    "throw NullPointerException()"
    key(left:2)
throw cast:				
    "throw ClassCastException()"
    key(left:2)
throw jason:				
    "throw JSONException()"
    key(left:2)
throw file:				
    "throw FileNotFoundException()"
    key(left:2)

android toast:			
    "Toast.makeText(baseContext, '', Toast.LENGTH_LONG).show()"
    key(left:28)


arrow: 					"->"
elvis: 					"?:"

# commands from jetbrains.talon
