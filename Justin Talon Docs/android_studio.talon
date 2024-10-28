# Requires https://plugins.jetbrains.com/plugin/10504-voice-code-idea
# NOTE: seems like you can't mix up "app" and "app.name"

# app.name: Android Studio
app: Android Studio
app: jetbrains
# app.name: IntelliJ IDEA
-

# key_wait increases the delay when pressing keys (milliseconds)
# this is useful if an app seems to jumble or drop keys
settings():
    key_wait = 8.0

# template words: shift ctrl alt

# IDE voice commands
android settings: key(ctrl-alt-s)
project structure: key(ctrl-alt-shift-s)
rebuild [project]: key(ctrl-alt-shift-f4)
zen mode: key(ctrl-alt-shift-z)
[android] info:	key(alt-enter)
[info] suggestion: key(alt-shift-enter)
[android] help:	key(ctrl-q)
[android] search: key(ctrl-shift-a)
[search] everywhere: key(ctrl-alt-shift-f9)
[search] (file|files): key(ctrl-shift-f)
regex: key(alt-x)

duplicate [line]: key(ctrl-d)
android case: key(ctrl-shift-u)

device manager: key(ctrl-alt-shift-1)
[select] device: key(alt-shift-f11)

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
menu git: key(alt-g)
menu window: key(alt-w)
menu help: key(alt-h)

panel project: key(alt-1)
panel favorites: key(alt-2)
panel find:	key(alt-3)
panel run: key(alt-4)
panel debug: key(alt-5)
panel [app] quality [insights]:key(ctrl-alt-f2)
panel problems:	key(alt-6)
panel structure: key(alt-7)
panel git: key(alt-9)
panel commit: key(alt-0)
panel logcat: key(alt-f11)
panel terminal: key(alt-f12)
panel resource [manager]: key(ctrl-alt-shift-f1)
panel inspection: key(ctrl-alt-shift-f11)
panel device: key(ctrl-alt-shift-f12)
[panel] gemini: key(alt-shift-f1)
[panel] (emulator|robot): key(ctrl-alt-shift-f2)

view left:				key(alt-shift-left)			
view right:				key(alt-shift-right)
[build] refresh:        key(ctrl-shift-f5)
(tab|code) (last|left):	key(alt-left)
(tab|code) (next|right): key(alt-right)
(tab|code) close:				key(ctrl-f4)
[next] splitter: key(ctrl-alt-shift-f5)
move splitter: key(ctrl-alt-shift-f6)
maximize [tab]:key(ctrl-alt-shift-f3)
code reformat: key(ctrl-alt-l)
block up:				key(alt-up)
block down:				key(alt-down)
matching [bracket]:     key(ctrl-shift-m)
comment line:			key(ctrl-/)
comment block:			key(ctrl-shift-/)
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
[android] synchronize: key(ctrl-shift-o)

rotate left: key(ctrl-l)
rotate right: key(ctrl-r)
(emulator|robot) home: key(ctrl-shift-h)
(emulator|robot) overview: key(ctrl-shift-w)
(emulator|robot|go) back: key(ctrl-shift-b)

[android] menu:			key(ctrl-space)
[android] hierarchy:	key(ctrl-h)
[android] usage:		key(ctrl-b)	

run [it]:			key(alt-shift-f10)
edit [config|configuration|configurations]: key(ctrl-alt-shift-f10)
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
[new] watch:		key(insert)
warning next:			key(f2)
warning previous:		key(shift-f2)
clear logcat: key(ctrl-alt-shift-8)

# compound commands
(navigate|jump) <number_small>:
    key(ctrl-g)
    key(delete)
    key(delete)
    insert(number_small)
    # key(enter)



android tag:				
    'private const val TAG = ""'
    key(left:1)
android invoke:			
    'suspend operator fun invoke()'
    key(left:1)
(todo|to do):
    '// Todo: '
log verbose:				
    'Log.v("", "")'
    key(left:2)
log debug:				
    'Log.d("", "")'
    key(left:2)
log info:
    'Log.i("", "")'
    key(left:2)
log warning:				
    'Log.w("", "")'
    key(left:2)
log error:				
    'Log.e("", "")'
    key(left:2)
            
throw exception:			
    "throw Exception()"
    key(left:1)
throw state:				
    "throw IllegalStateException()"
    key(left:1)
throw argument:			
    "throw IllegalArgumentException()"
    key(left:1)
throw null:				
    "throw NullPointerException()"
    key(left:1)
throw cast:				
    "throw ClassCastException()"
    key(left:1)
throw jason:				
    "throw JSONException()"
    key(left:1)
throw file:				
    "throw FileNotFoundException()"
    key(left:1)


arrow: 					"->"
elvis: 					"?:"

# commands from jetbrains.talon
