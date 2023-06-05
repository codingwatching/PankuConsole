extends Resource

var console:PankuConsole

@export var export_comment_1 = "You can find config file at " + PankuConsole.Config.FILE_PATH

@export_group("Window Appearance")

@export var blur_effect:bool = true:
	set(v):
		pass
		# console._full_repl.material.set("shader_parameter/lod", 4.0 if v else 0.0)
	get:
		return false
		# return console._full_repl.material.get("shader_parameter/lod") > 0.0

@export var base_color:Color = Color(0.0, 0.0, 0.0, 0.1):
	set(v):
		# console._full_repl.material.set("shader_parameter/modulate", v)
		pass
	get:
		# return console._full_repl.material.get("shader_parameter/modulate")
		return base_color

@export_group("REPL")

@export var export_comment_unified_visibility = "unified_visibility will keep all windows' visibility the same as REPL window"
@export var unified_visibility:bool = false:
	set(v):
		# console.unified_visibility = v
		pass
	get:
		# return console.unified_visibility
		return false

@export_range(12,20) var output_font_size:int:
	set(v):
		# console._full_repl.get_content()._console_logs.set_font_size(v)
		pass
	get:
		# return console._full_repl.get_content()._console_logs.get_font_size()
		return 0
@export var export_button_clear_repl_output = "Clear REPL Output"
@export var export_comment_2 = "Whether the whole game should be paused when REPL window is visible"
@export var freeze_when_popup:bool = true:
	set(v):
		# console.pause_when_active = v
		pass
	get:
		# return console.pause_when_active
		return false
@export var mini_mode:bool = false:
	set(v):
		# console.mini_repl_mode = v
		pass
	get:
		# return console.mini_repl_mode
		return false
@export var export_comment_3 = "init_expression will be executed when the project starts"
@export var init_expression:String = "":
	set(v):
		console.init_expression = v
	get:
		return console.init_expression

@export_group("Tools")
@export var export_button_add_profiler_widget := "Add Profiler Monitor"
# @export var export_button_open_expression_key_mapper := "Open Expression Key Mapper"
# @export var export_button_open_expression_history := "Open Expression History"
#@export var export_button_open_logger := "Open Logger"

@export_group("Experimental")
@export var enable_os_window := false:
	set(v):
		console.w_manager.enable_os_popup_btns(v)
	get:
		return console.w_manager.os_popup_btn_enabled
@export var os_window_bg_color:Color:
	set(v):
		console.w_manager.set_os_window_bg_color(v)
	get:
		return console.w_manager.os_window_bg_color

@export_group("About")
@export var export_button_show_intro := "Show Intro"
# @export var export_button_check_update := "Check Update"
@export var export_button_report_bugs := "Report Bugs"
@export var export_button_suggest_features := "Suggest Features"
@export var export_comment_4 = "Hint: The whole UI of settings is totally generated by exporter, you can view the source in options.gd"


#export button callbacks

func clear_repl_output():
	console.execute("console.cls")

func add_profiler_widget():
	console.execute("console.add_profiler")

# func open_expression_key_mapper():
# 	console.open_expression_key_mapper()

# func open_expression_history():
# 	console.open_expression_history()
	
#func open_logger():
#	console.open_logger()

func show_intro():
	console.show_intro()

# func check_update():
# 	console.execute("console.check_update")

func report_bugs():
	OS.shell_open("https://github.com/Ark2000/PankuConsole/issues")

func suggest_features():
	OS.shell_open("https://github.com/Ark2000/PankuConsole/issues")
