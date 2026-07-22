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

# TESTING FUNCTION CALLS
# comment test:  user.idea("comment_test")
#  user.idea("action ")
comment test: code.toggle_comment()
panel test: user.idea("action ActivateProjectToolWindow")

# IDE voice commands
android settings:  user.idea("action ShowSettings")
project structure: user.idea("action ShowProjectStructureSettings")
rebuild [project]: user.idea("action ")
zen mode: user.idea("action ToggleZenMode")
[android] info:	user.idea("action ")
[info] suggestion: user.idea("action ")
[android] help:	user.idea("action ")
[android] search: user.idea("action ")
[search] everywhere: user.idea("action SearchEverywhere")
[search] (file|files): user.idea("action ")
regex: user.idea("action ")

duplicate [line]: user.idea("action ")
android case: user.idea("action ")

menu file: user.idea("action FileMenu")
menu edit: user.idea("action EditMenu")
menu view: user.idea("action ViewMenu")
menu navigate: user.idea("action GoToMenu")
menu code: user.idea("action CodeMenu")
menu (refactor|refactoring): user.idea("action RefactoringMenu")
menu build:	user.idea("action BuildMenu")
menu run: user.idea("action RunMenu")
menu tools: user.idea("action ToolsMenu")
menu git: user.idea("action VcsGroup")
menu window: user.idea("action WindowMenu")
menu help: user.idea("action HelpMenu")

panel project:  user.idea("action ActivateProjectToolWindow")
panel favorites: user.idea("action ActivateFavoritesToolWindow")
panel find: user.idea("action ActivateFindToolWindow")
panel run: user.idea("action ActivateRunToolWindow")
panel debug: user.idea("action ActivateDebugToolWindow")
panel [app] quality [insights]: user.idea("action ActivateAppQualityInsightsToolWindow")
panel problems: user.idea("action ActivateProblemsViewToolWindow")
panel to do: user.idea("action ActivateTODOToolWindow")
panel structure: user.idea("action ActivateStructureToolWindow")
panel git: user.idea("action ActivateVersionControlToolWindow")
panel commit: user.idea("action ActivateCommitToolWindow")
panel logcat: user.idea("action ActivateLogcatToolWindow")
panel terminal: user.idea("action ActivateTerminalToolWindow")
panel resource [manager]: user.idea("action ResourceExplorer.open")
panel inspection: user.idea("action ")
[panel] device manager:  user.idea("action ActivateDeviceManager2ToolWindow")
[select] device: user.idea("action ")
panel device: user.idea("action ActivateRunningDevicesToolWindow")
[panel] gemini: user.idea("action ActivateStudioBotToolWindow")
[panel] (emulator|robot): user.idea("action ")

view (right|next):				user.idea("action ")
view (left|last):				user.idea("action ")
view refresh:        user.idea("action ")
# (tab|code) (last|left):	user.idea("action ")
code (last|left):	user.idea("action ")
# (tab|code) (next|right): user.idea("action ")
code (next|right): user.idea("action ")
(tab|code) close:				user.idea("action ")
[next] splitter: user.idea("action NextSplitter")
move splitter: user.idea("action MoveEditorToOppositeTabGroup")
maximize [tab]:  user.idea("action MaximizeEditorInSplit")
code reformat:  user.idea("action ")
block up:				 user.idea("action ")      
block down:				 user.idea("action ")
matching [bracket]:     user.idea("action ")
(navigate|jump): user.idea("action ")

comment line:			user.idea("action ")
comment block:			user.idea("action ")
android select:			user.idea("action ")
fold close:				user.idea("action ")
fold open:				user.idea("action ")
fold all:				user.idea("action ")

difference next: user.idea("action ")
difference previous: user.idea("action ")

refactor rename:		user.idea("action ")
refactor function:		user.idea("action ")
refactor options:		user.idea("action ")

[android] override:		user.idea("action ")
[android] implement:	user.idea("action ")
[android] generate:		user.idea("action ")
[android] construct:	user.idea("action ")
[android] members:		user.idea("action ")
[android] block:		user.idea("action ")
# [android] undo:			user.idea("action ")
# [android] redo:			user.idea("action ")
[android] synchronize: user.idea("action ")

android.device.rotate.left
rotate left: user.idea("action ")
android.device.rotate.right
rotate right: user.idea("action ")
(emulator|robot) home: user.idea("action ")
(emulator|robot) overview: user.idea("action ")
(emulator|robot|go) back: user.idea("action ")

[android] menu:			user.idea("action ")
[android] hierarchy:	user.idea("action ")
[android] usage:		user.idea("action ")

run [it]:			user.idea("action Run")
edit [config|configuration|configurations]: user.idea("action editRunConfigurations")
test run:				user.idea("action ")
[android] apply:		user.idea("action ")
[android] debug:		user.idea("action ")
[android] resume:		user.idea("action ")
stop [it]:			    user.idea("action ")
[android] evaluate:		user.idea("action ")
step into:				user.idea("action ")
step over:				user.idea("action ")
step cursor:			user.idea("action ")
breakpoint toggle:		user.idea("action ")
[new] watch:		user.idea("action ")
warning next:			user.idea("action ")
warning previous:		user.idea("action ")
clear logcat: user.idea("action Logcat.ClearLogcat") # IS NOT WORKING
open files: user.idea("action ")


open terminal: user.idea("action ")

# compound commands
# (navigate|jump) <number_small>:
    # (navigate|jump): user.idea("action ")
    # user.idea("action ")
    # user.idea("action ")
    # insert(number_small)
    # user.idea("action ")



android tag:				
    'private const val TAG = ""'
    user.idea("action ")
android invoke:			
    'suspend operator fun invoke()'
    user.idea("action ")
(todo|to do):
    '// Todo: '
log verbose:				
    'Log.v("", "")'
    user.idea("action ")
log debug:				
    'Log.d("", "")'
    user.idea("action ")
log info:
    'Log.i("", "")'
    user.idea("action ")
log warning:				
    'Log.w("", "")'
    user.idea("action ")
log error:				
    'Log.e("", "")'
    user.idea("action ")
            
throw exception:			
    "throw Exception()"
    user.idea("action ")
throw state:				
    "throw IllegalStateException()"
    user.idea("action ")
throw argument:			
    "throw IllegalArgumentException()"
    user.idea("action ")
throw null:				
    "throw NullPointerException()"
    user.idea("action ")
throw cast:				
    "throw ClassCastException()"
    user.idea("action ")
throw jason:				
    "throw JSONException()"
    user.idea("action ")
throw file:				
    "throw FileNotFoundException()"
    user.idea("action ")


arrow: "->"
elvis: "?:"

bold open: "&lt;b>"
bold close: "&lt;/b>"
italics open: "&lt;i>"
italics close: "&lt;/i>"
underline open: "&lt;u>"
underline close: "&lt;/u>"
line break: "&lt;br/>"


# commands from jetbrains.talon
