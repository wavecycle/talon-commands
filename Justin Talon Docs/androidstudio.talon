# Requires https://plugins.jetbrains.com/plugin/10504-voice-code-idea
# Uses Talon Community repo, calls functions in jetbrains.py

app: jetbrains
app: Android Studio

-

# user.idea("action ")
# this is useful if an app seems to jumble or drop user.idea("action ")
settings():
    user.idea("action ")
# template words: shift ctrl alt

# IDE voice commands
# android settings: user.idea("action Preferences") # DOESN'T WORK

project structure: user.idea("action ShowProjectStructureSettings")
rebuild [project]: user.idea("action ActivateProblemsViewToolWindow")
zen mode: user.idea("action ToggleZenMode")
[android] info:	user.idea("action ShowIntentionActions")
[search] everywhere: user.idea("action SearchEverywhere")
[search] actions: user.idea("action GotoAction")
## recent: calls jetbrains.talon
## select camel (left|right): calls jetbrains.talon
## go camel (left|right): calls jetbrains.talon

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
panel inspection: user.idea("action ActivateAppInspectionToolWindow")
[panel] device manager:  user.idea("action ActivateDeviceManager2ToolWindow")
[select] device: user.idea("action DeviceAndSnapshotComboBox")
panel device: user.idea("action ActivateRunningDevicesToolWindow")
[panel] gemini: user.idea("action ActivateStudioBotToolWindow")
[panel] (emulator|robot): user.idea("action ActivateRunningDevicesToolWindow")

(tab|code) (last|left):	user.idea("action PreviousTab")
(tab|code) (next|right): user.idea("action NextTab")
(tab|code) close: user.idea("action CloseContent")
[next] splitter: user.idea("action NextSplitter")
move splitter: user.idea("action MoveEditorToOppositeTabGroup")
maximize [tab]:  user.idea("action MaximizeEditorInSplit")
code reformat:  user.idea("action ReformatCode")
## fix imports: calls jetbrains.talon
[go] next (method | function): user.idea("action MethodDown")
[go] last (method | function): user.idea("action MethodUp")
## go <line number>: calls jetbrains.talon

comment line:			user.idea("action CommentByLineComment")
comment block:			user.idea("action CommentByBlockComment")
## select more:	calls jetbrains.talon
## select less: calls jetbrains.talon
fold close:				user.idea("action CollapseRegion")
fold open:				user.idea("action ExpandRegion")
fold all:				user.idea("action ExpandAllRegions")

# difference next: user.idea("action ")
# difference previous: user.idea("action ")

refactor rename:		user.idea("action RenameElement")
refactor filename:		user.idea("action RenameFile")
refactor function:		user.idea("action ExtractFunction")

[android] override:		user.idea("action OverrideMethods")
[android] implement:	user.idea("action ImplementMethods")
[android] generate:		user.idea("action Generate")
[android] (construct|complete statement): user.idea("action EditorCompleteStatement")
[android] synchronize: user.idea("action Android.SyncProject")

rotate left: user.idea("action android.device.rotate.left")
rotate right: user.idea("action android.device.rotate.right")
(emulator|robot) home: user.idea("action android.device.home.button")
(emulator|robot) overview: user.idea("action android.device.overview.button")
(emulator|robot|go) back: user.idea("action android.device.back.button")

[android] (menu|complete|completion): user.idea("action CodeCompletion")
[android] hierarchy:	user.idea("action TypeHierarchy")
[android] usage:		user.idea("action FindUsages")
## go declaration: calls jetbrains.talon

warning next:			user.idea("action GotoNextError")
warning previous:		user.idea("action GotoPreviousError")
## fix (last|next) (error|air): calls jetbrains.talon
run [it]:			user.idea("action Run")
# stop now: user.idea("execute Android.StopApp")
edit [config|configuration|configurations]: user.idea("action editRunConfigurations")
[android] apply:		user.idea("action [android] resume:		user.idea("action Android.ApplyChangesAndRestartActivity")")
[android] resume:		user.idea("action android.deploy.ApplyChanges")
[android] debug:		user.idea("action Debug")
[android] evaluate:		user.idea("action EvaluateExpression")
## toggle breakpoint: calls jetbrains.talon
## step into: calls jetbrains.talon
## step over: calls jetbrains.talon
## step smart: calls jetbrains.talon
## step to line: calls jetbrains.talon
## continue: calls jetbrains.talon
[new|add] watch: user.idea("action XDebugger.NewWatch")

open file: user.idea("action ShowFilePath")
[show] in project [panel]: user.idea("action SelectInProjectView")

# clear logcat:   user.idea("action Android.Logcat.ClearLog") DOESN'T WORK
# explorer test: user.idea("action RevealIn") DOESN'T WORK
# open terminal: user.idea("action OpenInTerminal") DOESN'T WORK

# Say "special click" to trigger the macro
action click:
    key("ctrl-alt:down")
    mouse_click(0)
    key("ctrl-alt:up")

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
